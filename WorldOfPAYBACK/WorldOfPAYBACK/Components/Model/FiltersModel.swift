//
//  FiltersModel.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import Foundation

protocol FiltersModelProtocol: AnyObject {
    var current: Filters { get }
    
    func save()
    func update(filter: String)
    func reset()
}

final class FiltersModel: FiltersModelProtocol {
    private let original: Filters
    private let dataManager: DataManagerProtocol
    
    private(set) var current: Filters
    
    init(filters: Filters, dataManager: DataManagerProtocol = DataManager.shared) {
        self.current = filters
        self.original = filters
        self.dataManager = dataManager
    }
    
    func save() {
        dataManager.cache(data: current.value, for: current.key)
    }
    
    func update(filter: String) {
        if let enabled = current.value[filter] {
            current.value[filter] = !enabled
        }
    }
    
    func reset() {
        current = original
    }
}
