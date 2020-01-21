//
//  CodesWrapper.swift
//  dcoder-task
//
//  Created by Dheeraj on 18/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

class CodeWrapper {
    
    //MARK:- Get Codes
    func getAllCodes(onSuccess: @escaping (Codes) -> Void, onFailure: @escaping (String) -> Void) {
        let urlRequest = RequestPath().codesRequest()
        Request.shared.send(for: Codes.self, urlRequest: urlRequest, onSuccess: { (codes) in
            onSuccess(codes)
        }) { (error) in
            onFailure(error.rawValue)
        }
    }
    
}
