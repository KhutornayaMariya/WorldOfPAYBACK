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
                .foregroundColor(.black)
            ForEach(model.transactionItems(), id: \.alias.reference) { transaction in
                NavigationLink(destination: DetailsView(transaction: transaction)) {
                    TransactionItemView(transaction: transaction)
                }
            }
        }
    }
    
    func makeToolbar() -> some View {
        var row: [FiltersViewModelTypes.Row] = []
        for category in model.categories {
            row.append(.init(title: String(category.key), selected: category.value))
        }
        let viewData = FiltersViewModelTypes.ViewData.init(title: "FILTERS".localized, rows: row, buttons: [FiltersViewModelTypes.Button.init(title: "APPLY_FILTERS".localized, kind: .apply), FiltersViewModelTypes.Button.init(title: "RESET_FILTERS".localized, kind: .reset)])
        let filtersView = FiltersModuleFactory().makeView(viewData: viewData, cacheKey: "categoriesFilter")
        
        return NavigationLink(destination: filtersView) {
            Text("FILTERS".localized)
        }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView(model: TransactionsHistoryViewModel())
    }
}
