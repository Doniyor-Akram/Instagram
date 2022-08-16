//
//  User.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import Foundation

struct Users: Hashable {
    var uid: String?
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String, email: String) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
