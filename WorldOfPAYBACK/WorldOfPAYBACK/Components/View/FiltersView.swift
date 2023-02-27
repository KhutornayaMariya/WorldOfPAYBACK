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
            .navigationTitle(viewModel.viewData.title)
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
        FiltersView(
            viewModel: FiltersViewModel(
                model: FiltersModel(
                    filters: Filters(key: "", value: ["1": true, "2": false, "3": true])
                )
            )
        )
    }
}
