//
//  CreatePostVC.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 06/04/2025.
//

import UIKit

class CreatePostVC: UIViewController, CreatePostViewProtocol {
    
    var presenter: (any CreatePostPresenterProtocol)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

    
}
