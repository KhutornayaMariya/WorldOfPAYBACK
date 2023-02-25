//
//  String+Extensions.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

extension String {
    var localized: String  {
        NSLocalizedString(self, comment: "")
    }
}
