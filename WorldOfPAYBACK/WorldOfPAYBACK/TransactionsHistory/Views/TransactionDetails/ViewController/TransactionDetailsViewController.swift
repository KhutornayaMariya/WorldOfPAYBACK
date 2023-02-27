//
//  TransactionDetailsViewController.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import UIKit
import SwiftUI

struct DetailsView: UIViewControllerRepresentable {
    let transaction: TransactionsHistory.Transaction
    
    func makeUIViewController(context: Context) -> TransactionDetailsViewController {
        return TransactionDetailsViewController(transaction: transaction)
    }

    func updateUIViewController(_ uiViewController: TransactionDetailsViewController, context: Context) { }
}

class TransactionDetailsViewController: UIViewController {
    
    private let transaction: TransactionsHistory.Transaction
    
    private lazy var transactionDetailsView: TransactionDetailsView = {
        let view = TransactionDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpView()
    }
    
    init(transaction: TransactionsHistory.Transaction) {
        self.transaction = transaction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        view.addSubview(transactionDetailsView)
        
        NSLayoutConstraint.activate([
            transactionDetailsView.topAnchor.constraint(equalTo: view.topAnchor),
            transactionDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transactionDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            transactionDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setUpView() {
        transactionDetailsView.configure(with: TransactionDetails(partnerTitle: transaction.partnerDisplayName,
                                                                  description: transaction.transactionDetail.description))
    }
}
