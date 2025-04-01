//
//  PostTableViewCell.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 01/04/2025.
//

import UIKit
import SwiftUI

class PostTableViewCell: UITableViewCell {

    private lazy var vStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var postHeaderHStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .top
        stackView.distribution = .fill
        return stackView
    }()
    
    
    private lazy var postOwnerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var ownerNameLabel : UILabel = {
        let label = UILabel()
        label.text = "name"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var ownerUsernameLabel : UILabel = {
        let label = UILabel()
        label.text = "@username"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var postImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "gear")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var postTextLabel : UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum text"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func addSubviews() {
        postHeaderHStackView.addArrangedSubview(postOwnerImageView)
        postHeaderHStackView.addArrangedSubview(ownerNameLabel)
        postHeaderHStackView.addArrangedSubview(ownerUsernameLabel)
        postHeaderHStackView.addArrangedSubview(UIView())
        vStackView.addArrangedSubview(postHeaderHStackView)
        vStackView.addArrangedSubview(postTextLabel)
        contentView.addSubview(vStackView)
    }

    func addConstraints() {
        vStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        postOwnerImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
    }
}

struct PostTableViewCellPreview: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UITableViewCell {
        return PostTableViewCell()
    }
    
    func updateUIView(_ uiView: UITableViewCell, context: Context) {
        // You can customize the cell here, e.g., setting labels or images
    }
}

struct PostTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        PostTableViewCellPreview()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
