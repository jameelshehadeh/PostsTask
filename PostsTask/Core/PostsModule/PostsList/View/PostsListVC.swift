//
//  PostsVC.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import UIKit
import SnapKit

class PostsListVC: UIViewController {
    
    var presenter: (any PostsListPresenterProtocol)?
    
    private(set) lazy var tableView : UITableView = {
        let tv: UITableView = UITableView(frame: .zero, style: .plain)
        tv.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()

    private(set) lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    private(set) lazy var profileImageView: ProfileImageView = {
        let profileImageView = ProfileImageView()
        profileImageView.delegate = self
        return profileImageView
    }()
    
    private lazy var barButtonItem: UIBarButtonItem = {
        let barButtonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushCreatePost))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        view.backgroundColor = .systemBackground
        addSubviews()
        presenter?.viewDidLoad()
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func pushCreatePost() {
        presenter?.pushCreatePost()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        setupProfileImageView()
    }
    
    private func setupProfileImageView() {
        let profileButtonItem = UIBarButtonItem(customView: profileImageView)
        navigationItem.leftBarButtonItem = profileButtonItem
    }
       
    private func addConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
    }

}

extension PostsListVC: ProfileImageViewDelegate {
    
    func didTapSwitchUser(_ switchedUser: User) {
        presenter?.switchUser(to: switchedUser)
    }
    
}
