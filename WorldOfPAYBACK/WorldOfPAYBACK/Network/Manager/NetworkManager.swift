//
//  NetworkManager.swift
//  WorldOfPAYBACK
//
//  Created by Mariya Khutornaya on 25.02.23.
//

import Foundation

protocol NetworkManagerProtocol {
    func request(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

final class NetworkManager {
    
    private let mainQueue = DispatchQueue.main
    
}

extension NetworkManager: NetworkManagerProtocol {
    
    func request(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard error == nil else {
                self.mainQueue.async { completion(.failure(.serverError)) }
                return
            }
            
            guard let data = data else {
                self.mainQueue.async { completion(.failure(.unknownError)) }
                return
            }
            
            self.mainQueue.async { completion(.success(data)) }
        })
        
        task.resume()
    }
}
