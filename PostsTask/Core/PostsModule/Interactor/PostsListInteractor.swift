//
//  PostsListInteractor.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

protocol PostsListInteractorProtocol {
    
    var presenter: PostsListPresenterProtocol? { get set }
    
}

class PostsListInteractor: PostsListInteractorProtocol {
    
    var presenter: PostsListPresenterProtocol? {
        didSet {
            getPosts()
        }
    }
    
    func getPosts() {
        presenter?.interactorDidFetchPosts(with: .success(posts))
    }
    
}



let posts: [Post] = [
    .init(userName: "John Doe", userProfileURL: "https://example.com/johndoe.jpg", text: "Had a great day at the park!", postImageURL: "https://example.com/park.jpg", createdAt: Date()),
    .init(userName: "Jane Smith", userProfileURL: "https://example.com/janesmith.jpg", text: "Loving the new book I started reading.", postImageURL: "https://example.com/book.jpg", createdAt: Date()),
    .init(userName: "Alice Brown", userProfileURL: "https://example.com/alicebrown.jpg", text: "Can't believe how much I learned today in class.", postImageURL: "https://example.com/class.jpg", createdAt: Date()),
    .init(userName: "Bob Johnson", userProfileURL: "https://example.com/bobjohnson.jpg", text: "My new puppy is the cutest!", postImageURL: "https://example.com/puppy.jpg", createdAt: Date()),
    .init(userName: "Charlie Lee", userProfileURL: "https://example.com/charlielee.jpg", text: "Exploring new trails this weekend.", postImageURL: "https://example.com/trail.jpg", createdAt: Date()),
    .init(userName: "Diana Green", userProfileURL: "https://example.com/dianagreen.jpg", text: "Amazing sunset today!", postImageURL: "https://example.com/sunset.jpg", createdAt: Date()),
    .init(userName: "Ethan White", userProfileURL: "https://example.com/ethanwhite.jpg", text: "Finally finished that big project!", postImageURL: "https://example.com/project.jpg", createdAt: Date()),
    .init(userName: "Fiona Black", userProfileURL: "https://example.com/fionablack.jpg", text: "Made a new recipe tonight, it turned out great!", postImageURL: "https://example.com/recipe.jpg", createdAt: Date()),
    .init(userName: "George King", userProfileURL: "https://example.com/georgeking.jpg", text: "Had an awesome time at the concert last night.", postImageURL: "https://example.com/concert.jpg", createdAt: Date())]
