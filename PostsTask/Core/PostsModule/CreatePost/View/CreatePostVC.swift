//
//  CreatePostVC.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 06/04/2025.
//

import UIKit
import SnapKit

class CreatePostVC: UIViewController, CreatePostViewProtocol {

    var presenter: (any CreatePostPresenterProtocol)?
    
    private lazy var postTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        return textView
    }()
    
    private lazy var errorLabel : UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.isHidden = true
        return label
    }()
    
    private(set) lazy var selectedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var pickImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pick Image", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit Post", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 8
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create post"
        view.backgroundColor = .systemBackground
        view.tintColor = .label
        setNavBarAppearance(.label)
        addSubviews()
        addConstraints()
        setupActions()
        setupDismissKeyboardGesture()
    }

    private func addSubviews() {
        view.addSubview(postTextView)
        view.addSubview(errorLabel)
        view.addSubview(selectedImageView)
        view.addSubview(pickImageButton)
        view.addSubview(submitButton)
    }
    
    private func addConstraints() {

        postTextView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(120)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(postTextView.snp.bottom).offset(10)
        }

        selectedImageView.snp.makeConstraints { make in
            make.top.equalTo(errorLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }

        pickImageButton.snp.makeConstraints { make in
            make.top.equalTo(selectedImageView.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(pickImageButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
    }

    private func setupActions() {
        pickImageButton.addTarget(self, action: #selector(pickImageTapped), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
    }

    private func setupDismissKeyboardGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func pickImageTapped() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }

    @objc private func submitTapped() {
        let postText = postTextView.text ?? ""
        let postImage = selectedImageView.image
        presenter?.createPost(postText, postImage)
    }
    
    func showValidationError(_ errorMsg: String) {
        errorLabel.text = errorMsg
        errorLabel.isHidden = false
    }
    
}
