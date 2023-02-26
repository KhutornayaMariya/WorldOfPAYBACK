//
//  FiltersView.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import SwiftUI

struct FiltersView: View {
    
    private enum Constants {
        static let safeArea: CGFloat = 32
        static let buttonHeight: CGFloat = 40
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                List{
                    // FilterItemView list
                }
                Button {
                    // action
                } label: {
                    Text("APPLY_FILTERS".localized)
                        .frame(maxWidth: UIScreen.main.bounds.width - Constants.safeArea, minHeight: Constants.buttonHeight)
                }
                .buttonStyle(.borderedProminent)
                Button {
                    // action
                } label: {
                    Text("RESET_FILTERS".localized)
                        .frame(maxWidth: UIScreen.main.bounds.width - Constants.safeArea, minHeight: Constants.buttonHeight)
                }
                .buttonStyle(.borderless)
            }
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
