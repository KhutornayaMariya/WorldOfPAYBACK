//
//  TransactionMockedRepository.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

final class TransactionMockedRepository: TransactionRepositoryProtocol {
    
    private enum Constants {
        static let stubsFile = "PBTransactions"
        static let fileType = "json"
    }
    
    func fetchTransactions(completionHandler: @escaping (Result<TransactionsHistory, NetworkError>) -> Void) {
        Bool.random() ? loadDataFromJson(completionHandler: completionHandler) : completionHandler(.failure(.timeoutError))
    }
    
    private func loadDataFromJson(completionHandler: @escaping (Result<TransactionsHistory, NetworkError>) -> Void) {
        if let url = Bundle.main.url(forResource: Constants.stubsFile, withExtension: Constants.fileType) {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(TransactionsHistory.self, from: data)
                completionHandler(.success(jsonData))
            } catch {
                completionHandler(.failure(.parseError(reason: error.localizedDescription)))
            }
        }
    }
}

extension Bool {
    static func random() -> Bool {
        return arc4random_uniform(2) == 0
    }
}
