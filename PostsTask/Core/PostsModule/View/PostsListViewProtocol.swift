//
//  PostsListViewProtocol.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

protocol PostsListViewProtocol {
    
    var presenter: PostsListPresenterProtocol? { set get}
    func reloadData()
    func updateLoadingState()
    func update(with error: Error)
    func didFetchUsers(_ users: [User])
    
}
