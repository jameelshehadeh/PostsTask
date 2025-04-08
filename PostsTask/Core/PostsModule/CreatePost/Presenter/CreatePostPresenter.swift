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

    func validatePostData(postText: String?, postImage: UIImage?) -> Bool {
        postText?.isEmpty == false || postImage != nil
    }
    
    func createPost(_ postText: String?, _ postImage: UIImage?) {
        guard validatePostData(postText: postText, postImage: postImage) else {
            view?.showValidationError("Please provide either text or image.")
            return
        }
        interactor?.createPost(postText, postImage)
        router?.popView()
    }
}
