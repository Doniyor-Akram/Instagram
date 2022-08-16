//
//  Post.swift
//  iosMyinsta
//
//  Created by Doniyor on 16/08/22.
//

import Foundation

struct Post: Hashable {
    var title: String?
    var content: String?
    var imageURL: String?
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    init(title: String, content: String, imageURL: String) {
        self.title = title
        self.content = content
        self.imageURL = imageURL
    }
}
