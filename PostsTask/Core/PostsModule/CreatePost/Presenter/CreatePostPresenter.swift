//
//  CreatePostPresenter.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 06/04/2025.
//

import Foundation

class CreatePostPresenter: CreatePostPresenterProtocol {
    
    var view: (any CreatePostViewProtocol)?
    
    var interactor: (any CreatePostInteractorProtocol)?
    
    var router: (any CreatePostRouting)?

    
}
