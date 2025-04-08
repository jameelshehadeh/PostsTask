//
//  CreatePostPresenter.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 06/04/2025.
//

import UIKit

class CreatePostPresenter: CreatePostPresenterProtocol {

    var view: (any CreatePostViewProtocol)?
    
    var interactor: (any CreatePostInteractorProtocol)?
    
    var router: (any CreatePostRouting)?

    func createPost(_ postText: String?, _ postImage: UIImage?) {
        interactor?.createPost(postText, postImage)
    }
}
