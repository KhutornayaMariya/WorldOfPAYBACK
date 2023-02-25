//
//  ServersStorage.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

public protocol ServersStorageProtocol: AnyObject {
    var currentServer: Server { get }
}

final class ServersStorage: ServersStorageProtocol {
    
    private enum Constants {

        static let serversFile = "server_info"
        static let serversFileType = "json"
        
        enum Server {
            case api
        }
    }
    
    private struct ServersData: Decodable {
        let production: Server
        let testing: Server

        var all: [Server] {
            [production, testing]
        }
    }
    
    private enum Scheme {
        case production, debug
    }
        
    private lazy var data: ServersData? = {
        guard let data = getServersData() else { return nil }
        return try? JSONDecoder().decode(ServersData.self, from: data)
    }()

    private lazy var scheme: Scheme = {
        #if DEBUG
        return .debug
        #elseif PRODUCTION
        return .production
        #endif
    }()
    
    var currentServer: Server {
        guard let productionServer = data?.production else {
            fatalError("Production Server is nil")
        }
        
        switch scheme {
        case .production:
            return productionServer
        case .debug:
            guard let testingServer = data?.testing else {
                fatalError("Testing Server is nil")
            }
            return testingServer
        }
    }
    
    private func getServersData() -> Data? {
        guard let fileUrl = Bundle.main.url(forResource: Constants.serversFile, withExtension: Constants.serversFileType)
        else { return nil }
        return try? Data(contentsOf: fileUrl)
    }
}
