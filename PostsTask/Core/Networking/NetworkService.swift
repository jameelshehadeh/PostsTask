//
//  NetworkService.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 01/04/2025.
//

import Foundation

class NetworkService: Networkable {
    
    func request<T>(_ fileName: String, completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
            guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
                completion(.failure(URLError(.badURL)))
                return
            }
            do {
                let data = try Data(contentsOf: url)
                let model: T = try self.decode(data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }
        
    }
    
    func decode<T>(_ data: Data) throws -> T where T : Decodable {
        try JSONDecoder().decode(T.self, from: data)
    }
    
}
