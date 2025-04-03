//
//  PostsRepositoryProtocol.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 01/04/2025.
//

import Foundation

protocol PostsRepositoryProtocol {
    
    func fetchPosts(completion: @escaping (Result<[Post], Error>)->())
    func fetchUsers(completion: @escaping (Result<[User], Error>)->())
    
}
