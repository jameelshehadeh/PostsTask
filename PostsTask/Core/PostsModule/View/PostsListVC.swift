//
//  PostsVC.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import UIKit

class PostsListVC: UIViewController {
    
    var presenter: (any PostsListPresenterProtocol)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension PostsListVC: PostsListViewProtocol {
    
    func update(with posts: [Post]) {

    }
    
    func update(with error: any Error) {
        
    }
    
}
