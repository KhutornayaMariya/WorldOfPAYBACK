//
//  TransactionRepositoryProtocol.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

protocol TransactionRepositoryProtocol: AnyObject {
    func fetchTransactions(completionHandler: @escaping (Result<TransactionsHistory, NetworkError>) -> Void)
}
