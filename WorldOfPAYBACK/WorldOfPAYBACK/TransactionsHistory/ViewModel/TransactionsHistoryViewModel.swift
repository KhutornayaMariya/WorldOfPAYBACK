//
//  TransactionsHistoryViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

protocol TransactionsHistoryViewModelProtocol {
    func transactionItems() -> [TransactionsHistory.Transaction]
    func categories() -> [Int]
}

class TransactionsHistoryViewModel: ObservableObject {
    
    private let repository: TransactionRepositoryProtocol
    private var items: [TransactionsHistory.Transaction] = []
    
    init(){
        self.repository = TransactionMockedRepository()
        updateTransactionList()
    }
    
    func updateTransactionList() {
        repository.fetchTransactions(completionHandler: { [weak self] result in
            switch result {
            case .success(let data):
                self?.items = data.items
            case .failure(let error):
                print(error)
            }
        })
    }
}

extension TransactionsHistoryViewModel: TransactionsHistoryViewModelProtocol {
    func transactionItems() -> [TransactionsHistory.Transaction] {
        let sortedItems = items.sorted(by: {
            let lhsDate = ($0.transactionDetail.bookingDate.convertToDate() ?? Date())
            let rhsDate = ($1.transactionDetail.bookingDate.convertToDate() ?? Date())
            return lhsDate.compare(rhsDate) == .orderedDescending
        })
        return sortedItems
    }
    
    func categories() -> [Int] {
        items.map{ $0.category }.sorted()
    }
}
