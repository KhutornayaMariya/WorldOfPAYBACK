//
//  NetworkConnectionErrorView.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import SwiftUI

struct NetworkConnectionErrorView: View {
    
    private enum Constants {
        static let stackSpacing: CGFloat = 20
        static let imageWidth: CGFloat = 85
        static let imageHeight: CGFloat = 60
    }
    
    var body: some View {
        VStack(spacing: Constants.stackSpacing) {
            Image(systemName: "wifi")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: Constants.imageWidth,
                       height: Constants.imageHeight)
            Text("NO_CONNECTION".localized)
                .multilineTextAlignment(.center)
                .font(.title3)
        }
        .padding()
    }
}

struct NetworkConnectionErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkConnectionErrorView()
    }
}
