//
//  CodeTableViewCell.swift
//  dcoder-task
//
//  Created by Dheeraj on 20/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import UIKit

class CodeTableViewCell: UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    @IBOutlet weak var upvotesLabel: UILabel!
    @IBOutlet weak var downvotesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK:- Configuration
    func configure(with code: Code) {
        self.titleLabel.text = code.title
        self.userImageView.sd_setImage(with: URL(string: code.userImageURL), placeholderImage: UIImage(systemName: "person.circle.fill"))
        self.usernameLabel.text = code.userName
        self.tagsLabel.text = code.tags.joined(separator: ", ")
        self.upvotesLabel.text = "\(code.upvotes)"
        self.downvotesLabel.text = "\(code.downvotes)"
        self.commentsLabel.text = "\(code.comments)"
        self.timeLabel.text = DateHelper().getReadableDate(from: code.time)
    }

}
