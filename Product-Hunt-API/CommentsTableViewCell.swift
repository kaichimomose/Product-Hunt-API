//
//  CommentsTableViewCell.swift
//  Product-Hunt-API
//
//  Created by Kaichi Momose on 2017/11/01.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bodyTextField: UITextView!
    
    var comment: Comment? {
        didSet {
            usernameLabel.text = comment?.name
            bodyTextField.text = comment?.body
        }
    }
    
}
