//
//  ProfileImageView.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 02/04/2025.
//

import UIKit
import SnapKit

protocol ProfileImageViewDelegate: AnyObject {
    func didTapSwitchUser(_ switchedUser: User)
}

class ProfileImageView: UIView {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.isHidden = true
        button.showsMenuAsPrimaryAction = true
        button.clipsToBounds = true
        return button
    }()
    
    weak var delegate: ProfileImageViewDelegate?

    var users: [User] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        snp.makeConstraints { make in
            make.size.equalTo(30) // Ensure the entire view is 30x30
        }
        
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview() // Fill the entire view
        }
        
    }
    
    func configureMenu(_ users: [User]){
        
        self.users = users
        
        let menu = UIMenu(title: "Switch Profile", options: .displayInline, children:
            getUserMenuActions()
        )
        
        guard let defaultUser = users.first else {return}
        // Switching to first user as a default user
        switchUser(defaultUser)
        button.menu = menu
    }
       
    func switchUser(_ user: User) {
        button.isHidden = false
        button.setImage(UIImage(named: user.profileImageURL ?? ""), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
    }
    
    private func getUserMenuActions() -> [UIAction] {
        var actions: [UIAction] = []
        
        users.forEach { user in
            let profileImage = UIImage(named: user.profileImageURL ?? "")
            actions.append(UIAction(title: user.name ?? "", image: profileImage?.circularImage()) { [weak self] _ in
                guard let self else { return }
                self.delegate?.didTapSwitchUser(user)
            })
        }
        
        return actions
    }
    
}
