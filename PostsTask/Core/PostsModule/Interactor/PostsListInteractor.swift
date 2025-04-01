//
//  PostsListInteractor.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

protocol PostsListInteractorProtocol {
    
    var presenter: PostsListPresenterProtocol? { get set }
    func getPosts()
    
}

class PostsListInteractor: PostsListInteractorProtocol {
    
    var presenter: PostsListPresenterProtocol?
    var repository: PostsRepositoryProtocol
    
    init(repository: PostsRepositoryProtocol) {
        self.repository = repository
    }
    
    func getPosts() {
        
        repository.fetchPosts { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let posts):
                self.presenter?.interactorDidFetchPosts(with: .success(posts))
            case .failure(let failure):
                break
            }
        }
        
    }
    
}
