//
//  TransactionRepositoryProtocol.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation
import Combine

protocol TransactionRepositoryProtocol: AnyObject {
    func filtersUpdates() -> AnyPublisher<[String: Bool], Never>
    func fetchTransactions(completionHandler: @escaping (Result<TransactionsHistory, NetworkError>) -> Void)
}
