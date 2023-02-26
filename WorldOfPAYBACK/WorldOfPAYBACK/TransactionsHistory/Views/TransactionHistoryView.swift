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
            List{
                ForEach(model.transactionItems(), id: \.alias.reference) { transaction in
                    NavigationLink(destination: DetailsView(transaction: transaction)) {
                        TransactionItemView(transaction: transaction)
                    }
                }
            }
            .navigationTitle("TRANSACTIONS_TITLE".localized)
        }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView(model: TransactionsHistoryViewModel())
    }
}
