//
//  TransactionHistoryView.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import SwiftUI

struct TransactionHistoryView: View {
    @ObservedObject var model: TransactionsHistoryViewModel
    @State private var error: Bool = false
    
    var body: some View {
        NavigationView {
            makeTransactionsList()
                .toolbar {
                    if !model.categories.isEmpty {
                        makeToolbar()
                    }
                }
                .navigationTitle("TRANSACTIONS_TITLE".localized)
                .overlay(alignment: .top) {
                    if error {
                        makeError()
                    }
                }
                .refreshable {
                    error = true
                }
        }
    }
}

// MARK: - Private methods

private extension TransactionHistoryView {
    
    func makeTransactionsList() -> some View {
        return List {
            Text("\("TRANSACTION_TOTAL".localized): \(model.transactionsSum())")
                .foregroundColor(.black)
            ForEach(model.transactionItems(), id: \.alias.reference) { transaction in
                NavigationLink(destination: DetailsView(transaction: transaction)) {
                    TransactionItemView(transaction: transaction)
                }
            }
        }
    }
    
    func makeToolbar() -> some View {
        let filtersView = FiltersModuleFactory()
            .makeView(filters: Filters(
                key: "categoriesFilter",
                value: model.categories
            ))
        
        return NavigationLink(destination: filtersView) {
            Text("FILTERS".localized)
        }
    }
    
    func makeError() -> some View {
        return VStack(spacing: 10) {
            Text("ERROR_MESSAGE".localized)
                .font(.title3)
            Button("REPEAT_BUTTON".localized) {
                self.error = false
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.green)
        .cornerRadius(5)
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView(model: TransactionsHistoryViewModel())
    }
}
