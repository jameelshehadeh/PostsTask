//
//  CreatePostPresenterProtocol.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 06/04/2025.
//

import Foundation

protocol CreatePostPresenterProtocol {

    var view: CreatePostViewProtocol? { get set }
    var interactor: CreatePostInteractorProtocol? { get set }
    var router: CreatePostRouting? { get set }
}
