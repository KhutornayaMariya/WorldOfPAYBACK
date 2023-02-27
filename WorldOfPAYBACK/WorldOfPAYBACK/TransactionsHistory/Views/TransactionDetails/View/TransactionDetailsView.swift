//
//  TransactionDetailsView.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import UIKit

struct TransactionDetails {
    let partnerTitle: String
    let description: String?
}

final class TransactionDetailsView: UIView {
    
    // MARK: - Private properties
    
    private lazy var partnerTitle: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var transactionDescription: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setUp() {
        backgroundColor = .systemBackground
        
        [partnerTitle, transactionDescription].forEach{ addSubview($0) }
        
        NSLayoutConstraint.activate([
            partnerTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: .safeArea),
            partnerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .safeArea),
            
            transactionDescription.topAnchor.constraint(equalTo: partnerTitle.bottomAnchor, constant: .safeArea),
            transactionDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .safeArea),
        ])
    }
}

extension TransactionDetailsView {
    func configure(with model: TransactionDetails) {
        partnerTitle.text = model.partnerTitle
        transactionDescription.text = model.description
    }
}

private extension CGFloat {
    static let safeArea: CGFloat = 16
}
