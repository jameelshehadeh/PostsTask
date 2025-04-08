//
//  CreatePostInteractor.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 06/04/2025.
//

import UIKit

protocol CreatePostInteractorProtocol {
    
    var presenter: CreatePostPresenterProtocol? { get set }
    func saveImageLocally(_ image: UIImage, completion: @escaping (URL?) -> Void)
    func createPost(_ postText: String?,_ postImage: UIImage?)
    func submitPost(text: String?, imageUrl: URL?)
}
