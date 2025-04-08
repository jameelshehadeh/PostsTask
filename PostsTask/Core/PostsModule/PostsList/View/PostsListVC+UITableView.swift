//
//  PostsListVC+UITableView.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 09/04/2025.
//

import UIKit

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
