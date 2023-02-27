//
//  FiltersModuleFactory.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import SwiftUI

final class FiltersModuleFactory {
    func makeView(filters: Filters) -> some View {
        let model = FiltersModel(filters: filters)
        let viewModel = FiltersViewModel(model: model)
        
        return FiltersView(viewModel: viewModel)
    }
}
