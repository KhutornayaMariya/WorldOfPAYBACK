//
//  CategoryBadgeView.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import SwiftUI

struct CategoryBadgeView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.black)
            .font(.caption)
    }
}

struct CategoryBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBadgeView(title: "Category 1")
    }
}
