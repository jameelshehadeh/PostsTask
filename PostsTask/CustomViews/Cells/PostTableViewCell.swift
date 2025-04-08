//
//  PostTableViewCell.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 01/04/2025.
//

import UIKit
import SwiftUI
import SDWebImage

class PostTableViewCell: UITableViewCell {

    private lazy var vStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
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
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var ownerNameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var ownerUsernameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var postImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var postTextLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
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
        vStackView.addArrangedSubview(postImageView)
        contentView.addSubview(vStackView)
    }

    func addConstraints() {
        vStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        postOwnerImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
    
        postImageView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(postImageView.snp.width)
        }
    }
    
    func configureUI(with post: Post) {
        ownerNameLabel.text = post.owner?.name ?? ""
        postOwnerImageView.image = UIImage(named: post.owner?.profileImageURL ?? "")
        postTextLabel.text = post.text
        ownerUsernameLabel.text = "@\(post.owner?.username ?? "")"
        
        if let imageURLString = post.postImageURL,
           let url = URL(string: imageURLString){

            postImageView.sd_setImage(with: url)
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
