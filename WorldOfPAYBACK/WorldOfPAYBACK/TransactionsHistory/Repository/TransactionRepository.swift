//
//  TransactionRepository.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

final class TransactionRepository {
    private let serverStorage: ServersStorageProtocol
    private let networkManager: NetworkManagerProtocol
    
    private lazy var url: URL? = {
        URL(string: serverStorage.currentServer.api.full + ApiMethods.transactionsHistory.path)
    }()
    
    init(serverStorage: ServersStorageProtocol,
         networkManager: NetworkManagerProtocol)
    {
        self.serverStorage = serverStorage
        self.networkManager = networkManager
    }
}

extension TransactionRepository: TransactionRepositoryProtocol {
    func fetchTransactions(completionHandler: @escaping (Result<TransactionsHistory, NetworkError>) -> Void) { }
}
