//
//  RequestPath.swift
//  dcoder-task
//
//  Created by Dheeraj on 18/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
    
    func value() -> String {
        return self.rawValue
    }
}

class RequestPath {
    
    private var urlComponents = URLComponents()
    
    init() {
        guard let hostUrl = plistValueForKey("Host_URL") else { return }
        urlComponents.scheme = "http"
        urlComponents.host = hostUrl
    }
    
    private func plistValueForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
    
    func chatRequest() -> URLRequest {
        urlComponents.path = "/test_json/chat.json"
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = HTTPMethod.get.value()
        return request
    }
    
    func codesRequest() -> URLRequest {
        urlComponents.path = "/test_json/codes.json"
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = HTTPMethod.get.value()
        return request
    }
    
}
