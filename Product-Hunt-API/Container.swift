//
//  Container.swift
//  Product-Hunt-API
//
//  Created by Kaichi Momose on 2017/11/01.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation

struct Post {
    let name: String
    let tagline: String
    let votesCount: Int
}

extension Post: Decodable {
    enum Keys: String, CodingKey {
        case name
        case tagline
        case votesCount = "votes_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let name = try container.decode(String.self, forKey: .name)
        let tagline = try container.decode(String.self, forKey: .tagline)
        let votesCount = try container.decode(Int.self, forKey: .votesCount)
        self.init(name: name, tagline: tagline, votesCount: votesCount)
    }
}
