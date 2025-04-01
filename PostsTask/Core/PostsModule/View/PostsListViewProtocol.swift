//
//  PostsListViewProtocol.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

protocol PostsListViewProtocol {
    
    var presenter: PostsListPresenterProtocol? { set get}
    func update(with posts: [Post])
    func update(with error: Error)
}
