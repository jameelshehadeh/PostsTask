//
//  PostsListInteractor.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

protocol PostsListInteractorProtocol {
    
    var presenter: PostsListPresenterProtocol? { get set }
    
}

class PostsListInteractor: PostsListInteractorProtocol {
    
    var presenter: PostsListPresenterProtocol? {
        didSet {
            getPosts()
        }
    }
    
    func getPosts() {
        
    }
    
}
