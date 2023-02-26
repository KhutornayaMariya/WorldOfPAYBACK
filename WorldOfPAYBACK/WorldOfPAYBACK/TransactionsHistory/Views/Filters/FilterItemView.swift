//
//  FilterItem.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import SwiftUI

struct FilterItemView: View {
    @Binding var isOn: Bool
    let title: String
    
    var body: some View {
        Button{
            isOn.toggle()
        } label: {
            HStack{
                Toggle(isOn: $isOn) {
                    Text(title)
                        .foregroundColor(.black)
                }
                .toggleStyle(CheckboxStyle())
                Spacer()
            }
        }
    }
}

struct FilterItemViewPreview: View {
    @State var isOn: Bool = true
    @State var title: String = "category 1"
    
    var body: some View {
        FilterItemView(isOn: $isOn, title: title)
    }
}

struct FilterItemView_Previews: PreviewProvider {
    static var previews: some View {
        FilterItemViewPreview()
    }
}
