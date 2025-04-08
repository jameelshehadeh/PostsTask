//
//  PostsListPresenter.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

class PostsListPresenter: PostsListPresenterProtocol {
        
    var router: (any PostsRouting)?
    
    var loadingState: LoadingState = .loading
 
    var getSectionCount: Int = 1
    
    var getItemCount: Int {
        posts?.count ?? 0
    }
    
    var view: PostsListViewProtocol?
    var interactor: PostsListInteractorProtocol?
    private var posts: [Post]?
    private var users: [User]?
    
    func viewDidLoad(){
        updateLoadingState(with: .loading)
        interactor?.getPosts()
        interactor?.getUsers()
        addObservers()
    }
    
    deinit {
        removeObservers()
    }
    
    func interactorDidFetchPosts(with result: Result<[Post],Error>) {
        
        defer {
            updateLoadingState(with: .idle)
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
    
    func interactorDidFetchUsers(with result: Result<[User], any Error>) {
        
        switch result {
        case .success(let users):
            DispatchQueue.main.async { [weak self] in
                guard let self else {return}
                self.view?.didFetchUsers(users)
            }
        case .failure(let failure):
            break
        }
        
    }
    
    func switchUser(to user: User) {
        interactor?.switchToUser(user)
    }
    
    func interactorDidSwitchUser(to user: User) {
        view?.switchToUser(user)
    }
    
    func getDataByIndex(_ index: Int) -> Post? {
        posts?[index]
    }
    
    
    func updateLoadingState(with loadingState: LoadingState) {
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            self.loadingState = loadingState
            self.view?.updateLoadingState()
        }
    }
    
    func pushCreatePost() {
        router?.pushCreatePost()
    }
    
    private func addObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(updatePost), name: .newPostCreated, object: nil)
    }
    
    private func removeObservers(){
        NotificationCenter.default.removeObserver(self, name: .newPostCreated, object: nil)
    }
    
    @objc private func updatePost(_ notification: NSNotification) {
        guard let newPost = notification.userInfo?["post"] as? Post else {return}
        posts?.insert(newPost, at: 0)
        view?.reloadData()
    }
    
}
