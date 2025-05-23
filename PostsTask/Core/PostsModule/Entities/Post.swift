//
//  Post.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 29/03/2025.
//

import Foundation

struct Post: Identifiable, Codable {
    
    var id: String = UUID().uuidString
    var owner: User?
    var text: String?
    var postImageURL: String?
    
}
