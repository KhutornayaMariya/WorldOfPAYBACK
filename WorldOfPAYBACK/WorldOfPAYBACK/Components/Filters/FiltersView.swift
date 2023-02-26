//
//  FiltersView.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import SwiftUI

struct FiltersView: View {
    @ObservedObject var viewModel: FiltersViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                makeCategoriesList()
                Spacer()
                makeButtons()
            }
        }
    }
}

private extension FiltersView {
    func makeCategoriesList() -> some View {
        return List {
            ForEach(viewModel.viewData.rows) { row in
                HStack {
                    Image(systemName: row.selected ? "checkmark.square" : "square")
                        .foregroundColor(.black)
                    Text(String(row.title))
                }
                .onTapGesture {
                    viewModel.didTap(row: row)
                }
            }
        }
    }
    
    func makeButtons() -> some View {
        return ForEach(viewModel.viewData.buttons) { button in
            Button {
                viewModel.didTap(button: button)
            } label: {
                Text(button.title)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(viewModel: FiltersViewModel(
            viewData: FiltersViewModelTypes.ViewData(
                title: "Filters",
                rows: [.init(title: "1", selected: false), .init(title: "2", selected: true)],
                buttons: [.init(title: "Apply", kind: .apply), .init(title: "Reset", kind: .reset)]
            ),
            model: FiltersModel(key: "categoriesFilter")
        ))
    }
}
