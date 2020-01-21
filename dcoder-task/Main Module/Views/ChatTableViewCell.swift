//
//  ChatTableViewCell.swift
//  dcoder-task
//
//  Created by Dheeraj on 19/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    //MARK:- Configuration
    func configure(with chat: Chat) {
        self.titleLabel.text = chat.title
        self.lastMessageLabel.text = chat.messages.last?.text ?? ""
    }

}
