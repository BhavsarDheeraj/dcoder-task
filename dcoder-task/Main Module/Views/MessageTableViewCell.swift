//
//  MessageTableViewCell.swift
//  dcoder-task
//
//  Created by Dheeraj on 19/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import UIKit
import SDWebImage

class MessageTableViewCell: UITableViewCell {

    class var identifier: String {
        return String(describing: self)
    }
    
    @IBOutlet weak var messageStack: UIStackView!
    @IBOutlet weak var chatStack: UIStackView!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK:- Configuration
    func configure(with message: Message) {
        self.setupViews(using: message)
        self.messageLabel.text = message.text
        self.usernameLabel.text = message.userName
        self.userImageView.sd_setImage(with: URL(string: message.userImageURL), placeholderImage: UIImage(systemName: "person.circle.fill"))
    }
    
    func setupViews(using chat: Message) {
        self.messageStack.alignment = chat.isSentByMe ? .trailing : .leading
        if chat.isSentByMe {
            self.chatStack.addArrangedSubview(self.chatStack.subviews[0])
        }
        self.messageLabel.textAlignment = chat.isSentByMe ? .right : .left
    }

}
