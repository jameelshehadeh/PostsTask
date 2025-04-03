//
//  PostsListPresenterProtocol.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

protocol PostsListPresenterProtocol {
    
    var view: PostsListViewProtocol? { get set}
    var interactor: PostsListInteractorProtocol? { get set }
    func interactorDidFetchPosts(with result: Result<[Post],Error>)
    func interactorDidFetchUsers(with result: Result<[User],Error>)
    func viewDidLoad()
    func getDataByIndex(_ index: Int) -> Post?
    var getItemCount: Int { get }
    var getSectionCount: Int { get }
    var loadingState: LoadingState { get }
    var router: PostsRouting? { get set }
    func pushCreatePost()
    func updateLoadingState(with loadingState: LoadingState)
    
}
