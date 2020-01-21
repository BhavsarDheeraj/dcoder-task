//
//  PopupTableViewCell.swift
//  dcoder-task
//
//  Created by Dheeraj on 20/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import UIKit

class PopupTableViewCell: UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK:- Configuration
    func configure(with popupItem: PopupItem) {
        if popupItem.isSelected {
            self.titleLabel.textColor = .white
            self.titleLabel.text = popupItem.title.uppercased()
        } else {
            self.titleLabel.textColor = .lightGray
            self.titleLabel.text = popupItem.title.capitalized
        }
    }

}
