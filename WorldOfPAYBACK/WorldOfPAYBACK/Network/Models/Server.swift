//
//  Server.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

public struct Server: Decodable, Equatable, Encodable {
    
    public struct Host: Decodable, Equatable, Encodable {
        let scheme: String
        let host: String
        
        public var full: String {
            scheme + "://" + host
        }
    }
    
    public let title: String
    public let api: Host
    
    public enum Kind: String {
        case production, testing
    }
}
