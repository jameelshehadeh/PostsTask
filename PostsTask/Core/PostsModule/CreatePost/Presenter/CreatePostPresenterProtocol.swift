//
//  CreatePostPresenterProtocol.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 06/04/2025.
//

import UIKit

protocol CreatePostPresenterProtocol {

    var view: CreatePostViewProtocol? { get set }
    var interactor: CreatePostInteractorProtocol? { get set }
    var router: CreatePostRouting? { get set }
    func createPost(_ postText: String?,_ postImage: UIImage?)
    
}
