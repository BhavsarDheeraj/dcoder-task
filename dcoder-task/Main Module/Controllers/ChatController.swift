//
//  ChatController.swift
//  dcoder-task
//
//  Created by Dheeraj on 19/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

class ChatController {
    
    var chats = [Chat]()
    var selectedChat: Chat?
    
    //MARK:- Get All Chat Messages
    func getAllChatMessages(onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void) {
        WrapperManager.shared.chatWrapper.getMessages(onSuccess: { (messages) in
            self.chats = [Chat(title: "Dcoder's DevChat", messages: messages)]
            onSuccess()
        }) { (message) in
            onFailure(message)
        }
    }
    
}
