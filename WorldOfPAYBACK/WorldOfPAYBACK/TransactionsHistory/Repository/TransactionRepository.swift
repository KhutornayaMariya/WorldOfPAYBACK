//
//  TransactionRepository.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation
import Combine

final class TransactionRepository {
    private let serverStorage: ServersStorageProtocol
    private let networkManager: NetworkManagerProtocol
    private let dataManager: DataManagerProtocol
    
    private lazy var url: URL? = {
        URL(string: serverStorage.currentServer.api.full + ApiMethods.transactionsHistory.path)
    }()
    
    init(serverStorage: ServersStorageProtocol,
         networkManager: NetworkManagerProtocol,
         dataManager: DataManagerProtocol)
    {
        self.serverStorage = serverStorage
        self.networkManager = networkManager
        self.dataManager = dataManager
    }
}

extension TransactionRepository: TransactionRepositoryProtocol {
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
    
    func fetchTransactions(completionHandler: @escaping (Result<TransactionsHistory, NetworkError>) -> Void) {
        guard let url = url else { return }
        networkManager.request(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(TransactionsHistory.self, from: data)
                    completionHandler(.success(data))
                } catch let error {
                    completionHandler(.failure(.parseError(reason: error.localizedDescription)))
                }
                
            case .failure(_):
                completionHandler(.failure(.unknownError))
            }
        }
    }
}
