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
        List{
            ForEach(model.transactionItems(), id: \.alias.reference) {transaction in
                Text(transaction.partnerDisplayName)
            }
        }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView(model: TransactionsHistoryViewModel())
    }
}
