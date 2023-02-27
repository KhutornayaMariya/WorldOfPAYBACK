//
//  FiltersViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import Foundation

protocol FiltersViewModelProtocol: ObservableObject {
    func didTap(row: FiltersViewModelTypes.Row)
    func didTap(button: FiltersViewModelTypes.Button)
    var viewData: FiltersViewModelTypes.ViewData { get }
}

final class FiltersViewModel: FiltersViewModelProtocol {
    @Published var viewData: FiltersViewModelTypes.ViewData
    private let model: FiltersModelProtocol
    private let dataMapper: FiltersDataMapperProtocol
    
    init(model: FiltersModelProtocol,
         dataMapper: FiltersDataMapperProtocol = FiltersDataMapper()) {
        
        self.model = model
        self.dataMapper = dataMapper
        
        viewData = dataMapper.map(model.current)
    }
    
    func didTap(row: FiltersViewModelTypes.Row) {
        model.update(filter: row.title)
        viewData = dataMapper.map(model.current)
    }
    
    func didTap(button: FiltersViewModelTypes.Button) {
        switch button.kind {
        case .apply:
            model.save()
            
        case .reset:
            model.reset()
            viewData = dataMapper.map(model.current)
        }
    }
}
