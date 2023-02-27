//
//  TransactionsHistory.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

struct TransactionsHistory: Decodable {
    
    let items: [Transaction]
    
    struct Transaction: Decodable {
        let partnerDisplayName: String
        let alias: Alias
        let category: Int
        let transactionDetail: Details
    }
}

extension TransactionsHistory {
    struct Alias: Decodable {
        let reference: String
    }
    
    struct Details: Decodable {
        let description: String?
        let bookingDate: String
        let value: Value
        
        
        func localizedDate() -> String {
            let date = bookingDate.convertToDate()
            return date?.convertToUsersLocal() ?? ""
        }
    }
}

extension TransactionsHistory.Details {
    struct Value: Decodable {
        let amount: Int
        let currency: String
    }
}
