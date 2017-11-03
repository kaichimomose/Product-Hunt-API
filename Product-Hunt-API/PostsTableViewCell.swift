//
//  PostsTableViewCell.swift
//  Product-Hunt-API
//
//  Created by Kaichi Momose on 2017/11/01.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit
import WebKit

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var voteCountsLabel: UILabel!
    @IBOutlet weak var productImage: WKWebView!
    
    var post: Post? {
        didSet {
            productNameLabel.text = post?.name
            taglineLabel.text = post?.tagline
            voteCountsLabel.text = "\(post?.votesCount ?? 0)"
            let request = URLRequest(url: (post?.imageUrl)!)
            productImage.load(request)
        }
    }
    
}
