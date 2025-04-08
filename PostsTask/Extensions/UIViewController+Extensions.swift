//
//  UIViewController+Extensions.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 09/04/2025.
//

import UIKit

extension UIViewController {
    
    func setNavBarAppearance(_ color: UIColor) {
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [
                .foregroundColor: color
            ]
            navigationBar.tintColor = color
        }
    }
    
}
