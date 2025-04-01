//
//  PostsListPresenter.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

class PostsListPresenter: PostsListPresenterProtocol {
 
    var getSectionCount: Int = 1
    
    var getItemCount: Int {
        posts?.count ?? 0
    }
    
    var view: PostsListViewProtocol?
    var interactor: PostsListInteractorProtocol?
    private var posts: [Post]?
    
    func viewDidLoad(){
        interactor?.getPosts()
    }
    
    func interactorDidFetchPosts(with result: Result<[Post],Error>) {
        switch result {
        case .success(let posts):
            self.posts = posts
            view?.reloadData()
        case .failure(let failure):
            view?.update(with: failure)
        }
    }
    
    func getDataByIndex(_ index: Int) -> Post? {
        posts?[index]
    }
    
    
}
