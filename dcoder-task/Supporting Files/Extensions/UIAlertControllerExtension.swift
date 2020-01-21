//
//  UIAlertControllerExtension.swift
//  dcoder-task
//
//  Created by Dheeraj on 20/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import UIKit

extension UIAlertController {

    //Set background color of UIAlertController
    func setBackgroundColor(color: UIColor) {
        if let bgView = self.view.subviews.first, let groupView = bgView.subviews.first, let contentView = groupView.subviews.first {
            contentView.backgroundColor = color
        }
    }

    //Set title color
    func setTitleColor(color: UIColor) {
        guard let title = self.title else { return }
        let attributeString = NSMutableAttributedString(string: title)
        attributeString.addAttributes([NSAttributedString.Key.foregroundColor : color], range: NSMakeRange(0, title.utf8.count))
        self.setValue(attributeString, forKey: "attributedTitle")
    }

    //Set message color
    func setMessageColor(color: UIColor) {
        guard let message = self.message else { return }
        let attributeString = NSMutableAttributedString(string: message)
        attributeString.addAttributes([NSAttributedString.Key.foregroundColor : color], range: NSMakeRange(0, message.utf8.count))
        self.setValue(attributeString, forKey: "attributedMessage")
    }

    //Set tint color of UIAlertController
    func setTint(color: UIColor) {
        self.view.tintColor = color
    }
}
