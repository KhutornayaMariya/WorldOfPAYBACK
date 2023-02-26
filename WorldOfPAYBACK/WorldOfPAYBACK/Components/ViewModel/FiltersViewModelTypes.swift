//
//  FiltersViewModelTypes.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import Foundation

final class FiltersViewModelTypes {
    struct Row: Hashable, Identifiable {
        let title: String
        let selected: Bool
        
        var id: Int {
            hashValue
        }
    }
    
    struct Button: Hashable, Identifiable {
        enum Kind: Hashable {
            case apply
            case reset
        }
        
        let title: String
        let kind: Kind
        
        var id: Int {
            hashValue
        }
    }
    
    struct ViewData: Hashable {
        let title: String
        let rows: [Row]
        let buttons: [Button]
    }
}
