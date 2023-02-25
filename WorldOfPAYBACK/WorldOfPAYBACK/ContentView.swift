//
//  ContentView.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkMonitor = NetworkMonitor()
    
    var body: some View {
        if networkMonitor.hasConnection {
            TransactionHistoryView(model: TransactionsHistoryViewModel())
        } else {
            NetworkConnectionErrorView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
