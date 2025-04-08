//
//  PostsListVC+PostsListViewProtocol.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 09/04/2025.
//

import UIKit

extension PostsListVC: PostsListViewProtocol {
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func update(with error: any Error) {
        
    }
    
    func updateLoadingState() {
        guard let loadingState = presenter?.loadingState else { return }
        switch loadingState {
        case .loading:
            tableView.isHidden = true
            activityIndicator.startAnimating()
        case .idle:
            tableView.isHidden = false
            activityIndicator.stopAnimating()
        }
    }
    
    func didFetchUsers(_ users: [User]) {
        profileImageView.configureMenu(users)
    }
    
    func switchToUser(_ user: User) {
        profileImageView.switchUser(user)
    }
    
}
