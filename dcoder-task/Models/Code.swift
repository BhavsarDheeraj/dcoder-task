//
//  Code.swift
//  dcoder-task
//
//  Created by Dheeraj on 19/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

//MARK: - Codes
typealias Codes = [Code]

//MARK: - Code
struct Code: Codable {
    let userName: String
    let userImageURL: String
    let time: String
    let tags: [String]
    let title, code: String
    let codeLanguage: String
    let upvotes, downvotes, comments: Int

    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case userImageURL = "user_image_url"
        case time, tags, title, code
        case codeLanguage = "code_language"
        case upvotes, downvotes, comments
    }
}
