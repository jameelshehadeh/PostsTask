//
//  Networkable.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 01/04/2025.
//

import Foundation

protocol Networkable {
    
    // Simulating networking calls 
    func request<T: Decodable>(_ fileName: String, completion: @escaping (Result<T, Error>) -> Void)
    func decode<T: Decodable>(_ data: Data) throws -> T
    
}
