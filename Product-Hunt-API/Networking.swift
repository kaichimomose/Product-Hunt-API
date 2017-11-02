//
//  Networking.swift
//  Product-Hunt-API
//
//  Created by Kaichi Momose on 2017/11/01.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation

class Networking {
    let session = URLSession.shared
    let baseURL = "https://api.producthunt.com/v1"
    
    func fetch(resource: Resource, completion: @escaping ([Post]) -> ()) {
        let fullUrl = baseURL + resource.path()
        
        let url = URL(string: fullUrl)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = resource.header(token: "3c486e75957c3d8c0ee628b1cf0263782741826ad69cbf084e1d19317c1543cf")
        request.httpMethod = resource.httpMethod().rawValue
        
        session.dataTask(with: request) {(data, res, err) in
            if let data = data {
                
                let listPost = try? JSONDecoder().decode(ListPost.self, from: data)
                guard let aListPost = listPost?.posts else {return}
                completion(aListPost)
            }
        }.resume()
    }
}
