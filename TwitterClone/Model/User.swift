//
//  User.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 28/01/2021.
//

import Foundation

struct User: Identifiable {
    
    let id: String
    let username: String
    let profileImageURL: String
    let fullname: String
    let email: String
    
    init(dictionary: [String : Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}
