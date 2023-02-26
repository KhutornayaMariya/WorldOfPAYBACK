//
//  TransactionMockedRepository.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation
import Combine

final class TransactionMockedRepository: TransactionRepositoryProtocol {
    var filtersUpdate = PassthroughSubject<[String : Bool], Never>()
    private let dataManager: DataManagerProtocol
    
    private enum Constants {
        static let stubsFile = "PBTransactions"
        static let fileType = "json"
    }
    
    init(dataManager: DataManagerProtocol)
    {
        self.dataManager = dataManager
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
    
    func filtersUpdates() -> AnyPublisher<[String : Bool], Never> {
        dataManager.updatedKey
            .filter { $0 == "categoriesFilter" }
            .flatMap { [weak self] key -> AnyPublisher<[String : Bool], Never> in
                guard let self = self else {
                    return Empty().eraseToAnyPublisher()
                }
                
                return Just(self.dataManager.fetch(by: "categoriesFilter")).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}

extension Bool {
    static func random() -> Bool {
        return arc4random_uniform(2) == 0
    }
}
