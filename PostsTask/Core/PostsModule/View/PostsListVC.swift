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
    
    private lazy var tableView : UITableView = {
        let tv: UITableView = UITableView(frame: .zero, style: .plain)
        tv.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    private lazy var barButtonItem: UIBarButtonItem = {
        let barButtonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushCreatePost))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
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
        let profileImageView = ProfileImageView()
        profileImageView.delegate = self
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

extension PostsListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getItemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell , let model = presenter?.getDataByIndex(indexPath.row) else {
            return UITableViewCell()
        }
        cell.configureUI(with: model)
        return cell
    }
        
}

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
    
}

extension PostsListVC: ProfileImageViewDelegate {
    
    func profileImageViewDidTap() {
        
    }
    
}
