//
//  TransactionHistoryView.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import SwiftUI

struct TransactionHistoryView: View {
    @ObservedObject var model: TransactionsHistoryViewModel
    
    var body: some View {
        NavigationView {
            makeTransactionsList()
                .toolbar {
                    makeToolbar()
                }
                .navigationTitle("TRANSACTIONS_TITLE".localized)
        }
    }
}

// MARK: - Private methods

private extension TransactionHistoryView {
    
    func makeTransactionsList() -> some View {
        return List {
            Text("\("TRANSACTION_TOTAL".localized): \(model.transactionsSum())")
                .frame(width: .infinity)
                .foregroundColor(.black)
            ForEach(model.transactionItems(), id: \.alias.reference) { transaction in
                NavigationLink(destination: DetailsView(transaction: transaction)) {
                    TransactionItemView(transaction: transaction)
                }
            }
        }
    }
    
    func makeToolbar() -> some View {
        return NavigationLink(destination: FiltersView()) {
            Text("FILTERS".localized)
        }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView(model: TransactionsHistoryViewModel())
    }
}
