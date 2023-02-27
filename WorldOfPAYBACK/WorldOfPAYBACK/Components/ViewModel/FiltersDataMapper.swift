//
//  FiltersDataMapper.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import Foundation

protocol FiltersDataMapperProtocol: AnyObject {
    func map(_ filters: Filters) -> FiltersViewModelTypes.ViewData
}

final class FiltersDataMapper: FiltersDataMapperProtocol {
    func map(_ filters: Filters) -> FiltersViewModelTypes.ViewData {
        FiltersViewModelTypes.ViewData(
            title: "FILTERS".localizedFilters,
            rows: filters.value.map { value in
                FiltersViewModelTypes.Row(
                    title: value.key,
                    selected: value.value
                )
            },
            buttons: [
                FiltersViewModelTypes.Button(
                    title: "APPLY_FILTERS".localizedFilters,
                    kind: .apply
                ),
                FiltersViewModelTypes.Button(
                    title: "RESET_FILTERS".localizedFilters,
                    kind: .reset
                )
            ]
        )
    }
}
