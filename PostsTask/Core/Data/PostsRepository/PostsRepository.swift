//
//  PostsRepository.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 01/04/2025.
//

import Foundation

class PostsRepository: PostsRepositoryProtocol {
    
    private let networkService: Networkable
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchPosts(completion: @escaping (Result<[Post], any Error>) -> ()) {
        
        networkService.request("posts") { (result: Result<[Post], Error>) in
            switch result {
            case .success(let posts):
                completion(.success(posts))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
        
    }
    
}
