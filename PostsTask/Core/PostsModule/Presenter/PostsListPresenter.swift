//
//  PostsListPresenter.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

class PostsListPresenter: PostsListPresenterProtocol {
    
    var loadingState: LoadingState = .loading
 
    var getSectionCount: Int = 1
    
    var getItemCount: Int {
        posts?.count ?? 0
    }
    
    var view: PostsListViewProtocol?
    var interactor: PostsListInteractorProtocol?
    private var posts: [Post]?
    
    func viewDidLoad(){
        loadingState = .loading
        view?.updateLoadingState()
        interactor?.getPosts()
    }
    
    func interactorDidFetchPosts(with result: Result<[Post],Error>) {
        
        defer {
            DispatchQueue.main.async { [weak self] in
                self?.loadingState = .idle
                self?.view?.updateLoadingState()
            }
        }
        
        switch result {
        case .success(let posts):
            DispatchQueue.main.async { [weak self] in
                guard let self else {return}
                self.posts = posts
                view?.reloadData()
            }
        case .failure(let failure):
            view?.update(with: failure)
        }
    }
    
    func getDataByIndex(_ index: Int) -> Post? {
        posts?[index]
    }
    
    
}
