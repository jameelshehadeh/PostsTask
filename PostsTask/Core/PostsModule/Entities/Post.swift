//
//  Post.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

struct Post: Identifiable {
    
    var id: String = UUID().uuidString
    var userName: String?
    var userProfileURL: String?
    var text: String?
    var postImageURL: String?
    var createdAt: Date?
    
}
