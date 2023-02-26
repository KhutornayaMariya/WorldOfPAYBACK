//
//  FiltersModel.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import Foundation

protocol FiltersModelProtocol: AnyObject {
    func save(filters: [String: Bool])
}

final class FiltersModel: FiltersModelProtocol {
    private let key: String
    private let dataManager: DataManagerProtocol
    
    init(key: String, dataManager: DataManagerProtocol = DataManager.shared) {
        self.key = key
        self.dataManager = dataManager
    }
    
    func save(filters: [String: Bool]) {
        dataManager.cache(data: filters, key: key)
    }
}
