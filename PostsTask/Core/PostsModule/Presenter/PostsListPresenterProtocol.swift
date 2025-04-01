//
//  PostsListPresenterProtocol.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

protocol PostsListPresenterProtocol {
    
    var view: PostsListViewProtocol? { get set}
    var interactor: PostsListInteractorProtocol? { get set }
    func interactorDidFetchPosts(with result: Result<[Post],Error>)
    
}
