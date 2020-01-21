//
//  Errors.swift
//  dcoder-task
//
//  Created by Dheeraj on 18/01/20.
//  Copyright © 2020 Dheeraj Bhavsar. All rights reserved.
//

import Foundation

enum NetworkError: String {
    case somethingWentWrong = "Something went wrong."
    case badRequest         = "Service unavailable."
    case noInternet         = "No Internet Connection."
}
