//
//  CreatePostVC+UIImagePickerControllerDelegate.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 09/04/2025.
//

import UIKit

extension CreatePostVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            selectedImageView.image = image
            selectedImageView.isHidden = false
        }
        dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
}
