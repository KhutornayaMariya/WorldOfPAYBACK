//
//  NetworkError.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case parseError(reason: String)
    case timeoutError
    case unknownError
}
