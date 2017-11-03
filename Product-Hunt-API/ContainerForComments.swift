//
//  ContainerForComments.swift
//  Product-Hunt-API
//
//  Created by Kaichi Momose on 2017/11/02.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation

struct Comment {
    let body: String
    let name: String
    let username: String
}

extension Comment: Decodable {
    enum Keys: String, CodingKey {
        case body
        case user
    }
    
    enum UserKeys: String, CodingKey {
        case username
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let body = try container.decode(String.self, forKey: .body)
        let user = try container.nestedContainer(keyedBy: UserKeys.self, forKey: .user)
        let name = try user.decode(String.self, forKey: .name)
        let username = try user.decode(String.self, forKey: .username)
        self.init(body: body, name: name, username: username)
    }
}
