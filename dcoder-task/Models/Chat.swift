//
//  Chat.swift
//  dcoder-task
//
//  Created by Dheeraj on 19/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

//MARK: - Chat
class Chat {
    let title: String
    var messages = [Message]()
    
    init(title: String, messages: [Message] = []) {
        self.title = title
        self.messages = messages
    }
}
