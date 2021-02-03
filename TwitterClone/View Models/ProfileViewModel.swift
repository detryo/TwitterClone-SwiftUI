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
        checkUserIsFollowed()
    }
    
    func follow() {
        
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentUID).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followingRef.document(user.id).setData([:]) { _ in
            
            followersRef.document(currentUID).setData([:]) { _ in
                
                self.isFollowed = true
            }
        }
    }
    
    func unFollow() {
        
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentUID).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followingRef.document(user.id).delete { _ in
            
            followersRef.document(currentUID).delete { _ in
                
                self.isFollowed = false
            }
        }
    }
    
    func checkUserIsFollowed() {
        
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentUID).collection("user-following")
        
        followingRef.document(user.id).getDocument { snapshot, _ in
            
            guard let isFollowed = snapshot?.exists else { return }
            
            self.isFollowed = isFollowed
        }
    }
}
