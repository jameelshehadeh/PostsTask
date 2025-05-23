//
//  PostsRouter.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation
import UIKit

typealias EntryPoint = PostsListViewProtocol & UIViewController

protocol PostsRouting {
    var view: EntryPoint? { get set }
    static func start() -> PostsRouting
    func createNavigationController() -> UINavigationController
    func pushCreatePost()
}

class PostsRouter: PostsRouting {
    
    weak var view: EntryPoint?
    
    static func start() -> PostsRouting {
        let router = PostsRouter()
        let repository: PostsRepositoryProtocol = PostsRepository()
        var view: PostsListViewProtocol = PostsListVC(nibName: nil, bundle: nil)
        var interactor: PostsListInteractorProtocol = PostsListInteractor(repository: repository)
        var presenter: PostsListPresenterProtocol = PostsListPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.router = router
        router.view = view as? EntryPoint
        return router
    }
    
    func createNavigationController() -> UINavigationController {
        guard let view = view else {
            fatalError("EntryPoint view is nil. Ensure the router is properly initialized.")
        }
        return UINavigationController(rootViewController: view)
    }
    
    func pushCreatePost(){
        let createPostRouter: CreatePostRouting = CreatePostRouter.start()
        guard let createPostVC = createPostRouter.view else {
            fatalError("EntryPoint view is nil. Ensure the router is properly initialized.")
        }
        view?.navigationController?.pushViewController(createPostVC, animated: true)
    }
    
}
