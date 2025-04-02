//
//  ProfileImageView.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 02/04/2025.
//

import UIKit
import SnapKit

class ProfileImageView: UIView {

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "user1"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(profileImageView)
        setupConstraints()
        setupGesture()
    }
    
    private func setupConstraints() {
        
        snp.makeConstraints { make in
            make.size.equalTo(30) // Ensure the entire view is 30x30
        }
        
        profileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // Fill the entire view
        }
        
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileTapped))
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func profileTapped() {
        
    }
    
}
