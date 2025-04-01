//
//  PostsListPresenter.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

class PostsListPresenter: PostsListPresenterProtocol {
    
    var view: PostsListViewProtocol?
    var interactor: PostsListInteractorProtocol?
    
    func interactorDidFetchPosts(with result: Result<[Post],Error>) {
        switch result {
        case .success(let posts):
            view?.update(with: posts)
        case .failure(let failure):
            view?.update(with: failure)
        }
    }
    
    
}
