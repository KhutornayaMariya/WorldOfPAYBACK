//
//  DataManager.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 26.02.23.
//

import Foundation
import Combine

protocol DataManagerProtocol: AnyObject {
    func cache(data: Encodable, key: String)
    func fetch(by key: String) -> [String: Bool]
    
    var updatedKey: PassthroughSubject<String, Never> { get }
}

final class DataManager: DataManagerProtocol {
    static let shared = DataManager()
    
    let updatedKey = PassthroughSubject<String, Never>()
    
    private lazy var defaultDirectory: URL = {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }()
    
    func cache(data: Encodable, key: String) {
        guard let data = exec(function: { try JSONSerialization.data(withJSONObject: data) }) else {
            return
        }
        
        let path = defaultDirectory.appendingPathComponent(key)
        
        exec { try data.write(to: path) }
        
        updatedKey.send(key)
    }
    
    func fetch(by key: String) -> [String: Bool] {
        let data = exec { try Data(contentsOf: defaultDirectory.appendingPathComponent(key)) }

        guard let data = data else {
            return [:]
        }

        return exec { try (JSONSerialization.jsonObject(with: data)) } as? [String: Bool] ?? [:]
    }
}

private extension DataManager {
    func exec<T>(function: () throws -> T) -> T? {
        do {
            return try function()
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
