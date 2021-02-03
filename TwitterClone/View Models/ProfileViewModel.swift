//
//  ProfileViewModel.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 02/02/2021.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    
    let user: User
    @Published var isFollowed = false
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUID).collection("user-following").document(user.id).setData([:]) { _ in
            
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUID).setData([:]) { _ in
                
                self.isFollowed = true
            }
        }
    }
    
    func unFollow() {
        
        
    }
}
