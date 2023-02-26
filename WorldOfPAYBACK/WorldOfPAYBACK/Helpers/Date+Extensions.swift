//
//  DateManager.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

extension Date {
    func convertToUsersLocal() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat =  "d MMMM yyyy"
        formatter.locale = .current
        formatter.timeZone = .current
        
        return formatter.string(from: self)
    }
}
