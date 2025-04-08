//
//  CreatePostListInteractor.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 06/04/2025.
//

import UIKit

class CreatePostInteractor: CreatePostInteractorProtocol {

    var presenter: (any CreatePostPresenterProtocol)?
    
    func saveImageLocally(_ image: UIImage, completion: @escaping (URL?) -> Void) {
        
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let imageName = UUID().uuidString + ".jpg"
        let imageURL = documentsURL.appendingPathComponent(imageName)
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(nil)
            return
        }
        
        do {
            try imageData.write(to: imageURL)
            completion(imageURL)
        } catch {
            print("Error saving image: \(error.localizedDescription)")
            completion(nil)
        }
    }
    
    func createPost(_ postText: String?,_ postImage: UIImage?) {
        if let image = postImage {
            saveImageLocally(image) { [weak self] imageUrl in
                guard let self else {return}
                self.submitPost(text: postText, imageUrl: imageUrl)
            }
        } else {
            submitPost(text: postText, imageUrl: nil)
        }
    }
    

    func submitPost(text: String?, imageUrl: URL?) {
        guard let user = UserDefaults.standard.getCodableValue(dataType: User.self, key: "currentUser") else {
            return
        }
        let post = Post(id: UUID().uuidString, owner: user, text: text, postImageURL: imageUrl?.absoluteString, createdAt: "")
        NotificationCenter.default.post(name: .newPostCreated, object: nil,userInfo: ["post":post])
    }
    
}
