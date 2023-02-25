//
//  NetworkMonitor.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation
import Network

public protocol NetworkMonitorProtocol: ObservableObject {
    var hasConnection: Bool { get }
}

final class NetworkMonitor: NetworkMonitorProtocol {
    private let monitor = NWPathMonitor()
    @Published private(set) var hasConnection = false

    init() {
        monitor.start(queue: DispatchQueue.global())
        monitor.pathUpdateHandler = { [weak self] path in
            self?.hasConnection = path.status == .satisfied
        }
    }
}
