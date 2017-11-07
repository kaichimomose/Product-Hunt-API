//
//  CommentsTableViewCell.swift
//  Product-Hunt-API
//
//  Created by Kaichi Momose on 2017/11/01.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit
import WebKit

class CommentsTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bodyTextField: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImage: WKWebView!
    @IBOutlet weak var blinder: UIView!
    
    var comment: Comment? {
        didSet {
            usernameLabel.text = comment?.username
            bodyTextField.text = comment?.body
            nameLabel.text = comment?.name
            let request = URLRequest(url: (comment?.size)!)
            userImage.load(request)
        }
    }
    
}
