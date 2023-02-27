//
//  ApiMethods.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

enum ApiMethods {
    case transactionsHistory
    
    var path: String {
        switch self {
        case .transactionsHistory:
            return "/transactions"
        }
    }
}
