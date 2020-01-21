//
//  WrapperManager.swift
//  dcoder-task
//
//  Created by Dheeraj on 18/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

class WrapperManager {
    
    static let shared = WrapperManager()
    
    private init() {}
    
    let chatWrapper = ChatWrapper()
    let codeWrapper = CodeWrapper()
    
}
