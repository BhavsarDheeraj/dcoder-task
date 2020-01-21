//
//  Message.swift
//  dcoder-task
//
//  Created by Dheeraj on 19/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

//MARK: - Messages
typealias Messages = [Message]

//MARK: - Message
struct Message: Codable {
    let userName: String
    let userImageURL: String
    let isSentByMe: Bool
    let text: String

    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case userImageURL = "user_image_url"
        case isSentByMe = "is_sent_by_me"
        case text
    }
}
