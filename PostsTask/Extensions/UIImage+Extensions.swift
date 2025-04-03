//
//  File.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 03/04/2025.
//


import UIKit

extension UIImage {
    
    /// This function will crop the image into a circular shape and fill the circle
    func circularImage() -> UIImage? {
        let size = min(self.size.width, self.size.height)
        let imageRect = CGRect(x: (self.size.width - size) / 2, y: (self.size.height - size) / 2, width: size, height: size)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size, height: size), false, self.scale)
        
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: size, height: size))
        path.addClip()

        let imageWidth = self.size.width
        let imageHeight = self.size.height
        let scaleFactor = max(size / imageWidth, size / imageHeight)
        
        let scaledWidth = imageWidth * scaleFactor
        let scaledHeight = imageHeight * scaleFactor
        let offsetX = (scaledWidth - size) / 2
        let offsetY = (scaledHeight - size) / 2
        
        self.draw(in: CGRect(x: -offsetX, y: -offsetY, width: scaledWidth, height: scaledHeight))
        
        let circularImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return circularImage
    }
}
