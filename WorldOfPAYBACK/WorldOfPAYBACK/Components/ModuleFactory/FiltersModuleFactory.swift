//
//  FiltersModuleFactory.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import SwiftUI

final class FiltersModuleFactory {
    func makeView(viewData: FiltersViewModelTypes.ViewData, cacheKey: String) -> some View {
        let model = FiltersModel(key: cacheKey)
        let viewModel = FiltersViewModel(viewData: viewData, model: model)
        
        return FiltersView(viewModel: viewModel)
    }
}
