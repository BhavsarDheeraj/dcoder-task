//
//  ChatWrapper.swift
//  dcoder-task
//
//  Created by Dheeraj on 18/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

class ChatWrapper {
    
    //MARK:- Get Messages
    func getMessages(onSuccess: @escaping (Messages) -> Void, onFailure: @escaping (String) -> Void) {
        let urlRequest = RequestPath().chatRequest()
                
        Request.shared.send(for: Messages.self, urlRequest: urlRequest, onSuccess: { (chats) in
            onSuccess(chats)
        }) { (errorMessage) in
            onFailure(errorMessage.rawValue)
        }
    }
    
}
