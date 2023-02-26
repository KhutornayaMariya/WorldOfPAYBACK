//
//  CheckboxStyle.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import Foundation
import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundColor(.black)
                configuration.label
            }
        })
    }
}
