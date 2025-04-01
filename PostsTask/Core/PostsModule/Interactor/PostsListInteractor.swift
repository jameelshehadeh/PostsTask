//
//  PostsListInteractor.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

protocol PostsListInteractorProtocol {
    
    var presenter: PostsListPresenterProtocol? { get set }
    func getPosts()
    
}

class PostsListInteractor: PostsListInteractorProtocol {
    
    var presenter: PostsListPresenterProtocol?
    
    func getPosts() {
        
        let users = [
            User(id: "550e8400-e29b-41d4-a716-446655440000", name: "Alice Johnson", username: "alice", profileImageURL: "user3"),
            User(id: "6f9619ff-8b86-d011-b42d-00cf4fc964ff", name: "Bob Smith", username: "bob", profileImageURL: "user2"),
            User(id: "7d6f8bfe-cf9e-4e28-bcc9-3eaf0b7b8b25", name: "John Doe", username: "John Doe", profileImageURL: "user1")
        ]

        let mockPosts: [Post] = [
            Post(owner: users[0], text: "Enjoying a beautiful sunset today! 🌅", postImageURL: "", createdAt: Date()),
            Post(owner: users[1], text: "Had a great workout session! 💪", postImageURL: "", createdAt: Date()),
            Post(owner: users[2], text: "Exploring new tech trends! 🚀", postImageURL: nil, createdAt: Date()),
            Post(owner: users[0], text: "Coffee break ☕️ Who's in?", postImageURL: "", createdAt: Date()),
            Post(owner: users[1], text: "Testing !", postImageURL: "", createdAt: Date()),
            Post(owner: users[2], text: "Just finished reading an amazing book! 📚", postImageURL: nil, createdAt: Date())
        ]
        presenter?.interactorDidFetchPosts(with: .success(mockPosts))
    }
    
}
