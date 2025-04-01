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

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func addConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

extension PostsListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
        
}

extension PostsListVC: PostsListViewProtocol {
    
    func update(with posts: [Post]) {

    }
    
    func update(with error: any Error) {
        
    }
    
}
