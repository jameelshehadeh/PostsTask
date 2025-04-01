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
}

class PostsRouter: PostsRouting {
    
    weak var view: EntryPoint?
    
    static func start() -> PostsRouting {
        let router = PostsRouter()
        var view: PostsListViewProtocol = PostsListVC(nibName: nil, bundle: nil)
        var interactor: PostsListInteractorProtocol = PostsListInteractor()
        var presenter: PostsListPresenterProtocol = PostsListPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.view = view as? EntryPoint
        return router
    }
    
    func createNavigationController() -> UINavigationController {
        guard let view = view else {
            fatalError("EntryPoint view is nil. Ensure the router is properly initialized.")
        }
        return UINavigationController(rootViewController: view)
    }
    
}
