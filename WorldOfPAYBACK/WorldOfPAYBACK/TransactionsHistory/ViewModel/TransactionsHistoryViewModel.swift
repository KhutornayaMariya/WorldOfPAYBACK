//
//  TransactionsHistoryViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation
import Combine

protocol TransactionsHistoryViewModelProtocol {
    func transactionItems() -> [TransactionsHistory.Transaction]
    func transactionsSum() -> Int
}

class TransactionsHistoryViewModel: ObservableObject {
    
    @Published var categories: [String: Bool] = [:]
    private let repository: TransactionRepositoryProtocol
    private var items: [TransactionsHistory.Transaction] = []
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.repository = TransactionMockedRepository(dataManager: DataManager())
        updateTransactionList()
        subscribeToFiltersUpdate()
    }
    
    private func updateTransactionList() {
        repository.fetchTransactions(completionHandler: { [weak self] result in
            switch result {
            case .success(let data):
                guard let self = self else { return }
                self.items = data.items
                for category in self.getCategories() {
                    self.categories[String(category)] = false
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    private func getCategories() -> [Int] {
        items.map{ $0.category }.sorted()
    }
    
    private func subscribeToFiltersUpdate() {
        repository
            .filtersUpdates()
            .sink(receiveValue: { [weak self] filters in
                self?.categories = filters
            })
            .store(in: &subscriptions)
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
    
    func transactionsSum() -> Int {
        let selectedCategories = categories.filter { $0.value == true }
        let filteredItems = items.filter { transaction in
            selectedCategories.keys.contains(String(transaction.category))
        }
        let sum = filteredItems.map { $0.transactionDetail.value.amount }.reduce(0, +)
        return sum
    }
}
