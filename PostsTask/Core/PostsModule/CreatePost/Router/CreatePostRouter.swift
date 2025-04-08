//
//  CreatePostRouter.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 06/04/2025.
//

import UIKit

typealias CreatePostEntryPoint = CreatePostViewProtocol & UIViewController

protocol CreatePostRouting {
    var view: CreatePostEntryPoint? { get set }
    static func start() -> CreatePostRouting
    func popView()
}

final class CreatePostRouter: CreatePostRouting {
    
    weak var view: (any CreatePostEntryPoint)?
    
    static func start() -> CreatePostRouting {
        let router = CreatePostRouter()
        var view: CreatePostViewProtocol = CreatePostVC(nibName: nil, bundle: nil)
        var interactor: CreatePostInteractorProtocol = CreatePostInteractor()
        var presenter: CreatePostPresenterProtocol = CreatePostPresenter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.router = router
        router.view = view as? CreatePostEntryPoint
        return router
    }
    
    func popView() {
        view?.navigationController?.popViewController(animated: true)
    }
    
}
