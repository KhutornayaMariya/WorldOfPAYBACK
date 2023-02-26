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
    
    init(viewData: FiltersViewModelTypes.ViewData,
         model: FiltersModelProtocol) {
        
        self.viewData = viewData
        self.model = model
    }
    
    func didTap(row: FiltersViewModelTypes.Row) {
        model.save(filters: [row.title : row.selected])
    }
    
    func didTap(button: FiltersViewModelTypes.Button) {
        //
    }
}
