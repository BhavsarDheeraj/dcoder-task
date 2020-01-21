//
//  Request.swift
//  dcoder-task
//
//  Created by Dheeraj on 18/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

class Request {
    
    static let shared = Request()
    
    private init() {}
    
    func send<T: Codable>(for: T.Type = T.self, urlRequest: URLRequest, onSuccess: @escaping (T) -> Void, onFailure: @escaping (NetworkError) -> Void) {
        
        if Reachability.isConnectedToNetwork() {
            
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                
                if let error = error {
                    Logger.log(value: error)
                    onFailure(.somethingWentWrong)
                }
                
                if let response = response as? HTTPURLResponse {
                    if 200...300 ~= response.statusCode {
                        
                        if let data = data {
                            
                            do {
                                onSuccess(try JSONDecoder().decode(T.self, from: data))
                            } catch let decodeError {
                                Logger.log(value: decodeError)
                                onFailure(.somethingWentWrong)
                            }
                            
                        } else {
                            onFailure(.somethingWentWrong)
                        }
                        
                    } else if response.statusCode == 400 {
                        onFailure(.badRequest)
                    } else {
                        onFailure(.somethingWentWrong)
                    }
                } else {
                    onFailure(.somethingWentWrong)
                }
                
            }.resume()
            
        } else {
            onFailure(.noInternet)
        }
        
    }
    
}
