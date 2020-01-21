//
//  CodesController.swift
//  dcoder-task
//
//  Created by Dheeraj on 20/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

struct PopupItem {
    let title: String
    var isSelected = false
}

class CodesController {
    
    var sorts = [
        PopupItem(title: "Trending", isSelected: true),
        PopupItem(title: "Most Popular"),
        PopupItem(title: "Recent"),
        PopupItem(title: "My Codes"),
    ]
    
    var filters = [
        PopupItem(title: "All", isSelected: true),
        PopupItem(title: "Java"),
        PopupItem(title: "C++"),
        PopupItem(title: "C#"),
        PopupItem(title: "Python"),
        PopupItem(title: "C"),
    ]
    
    var codes: Codes = []
        
    //MARK:- Get All Codes
    func getAllCodes(onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void) {
        WrapperManager.shared.codeWrapper.getAllCodes(onSuccess: { (codes) in
            self.codes = codes
            onSuccess()
        }) { (message) in
            onFailure(message)
        }
    }
    
}
