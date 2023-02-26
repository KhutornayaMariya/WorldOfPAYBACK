//
//  TransactionItemView.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import SwiftUI

struct TransactionItemView: View {
    let transaction: TransactionsHistory.Transaction
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            VStack(alignment: .leading, spacing: 5) {
                Text(transaction.transactionDetail.localizedDate())
                    .foregroundColor(.gray)
                    .font(.caption)
                Text(transaction.partnerDisplayName)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .lineLimit(1)
                if let desc = transaction.transactionDetail.description {
                    Text(desc)
                        .foregroundColor(.gray)
                        .font(.caption)
                        .lineLimit(1)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("+ \(transaction.transactionDetail.value.amount) \(transaction.transactionDetail.value.currency)")
                .foregroundColor(.green)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
        }
    }
}

struct TransactionItemView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItemView(transaction: .init(partnerDisplayName: "DM", alias: .init(reference: "hfhfhfh"), category: 2, transactionDetail: .init(description: nil, bookingDate: "2022-03-23T10:59:05+0200", value: .init(amount: 200, currency: "PBP"))))
    }
}
