//
//  DataController.swift
//  dcoder-task
//
//  Created by Dheeraj on 19/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

class DataController {
    
    static let shared = DataController()
    
    private init() {}
    
    let chatController = ChatController()
    let codesController = CodesController()
    
}
