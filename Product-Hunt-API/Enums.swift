//
//  Enums.swift
//  Product-Hunt-API
//
//  Created by Kaichi Momose on 2017/11/01.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation

enum Class{
    
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

enum Resource {
    case posts
    case comments(postId: Int)
    
    func httpMethod() -> HttpMethod {
        switch self {
        case .posts, .comments:
            return .get
        }
    }
    
    func header(token: String) -> [String: String] {
        switch self {
        case .posts, .comments:
            return ["Accept": "application/json",
                    "Content-Type": "application/json",
                    "Authorization": "Bearer \(token)",
                    "Host": "api.producthunt.com"
            ]
        }
    }
    
    func path() -> String {
        switch self {
        case .posts:
            return "/me/feed"
        case .comments:
            return "/comments"
        }
    }
    
    func urlParameters() -> [String: String] {
        switch self {
        case .posts:
            return [:]
        case .comments(let postId):
            return ["search[post_id]": String(postId)]
        }
    }
    
    func body() -> Data? {
        switch self {
        case .posts, .comments:
            return nil
        }
    }
}
