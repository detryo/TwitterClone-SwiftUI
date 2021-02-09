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
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    init(user: User) {
        self.user = user
        checkUserIsFollowed()
        fetchUserTweets()
        fetchLikeTweets()
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
    
    func fetchUserTweets() {
        
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            
            self.userTweets = documents.map({ Tweet(dictionary: $0.data() )})
        }
    }
    
    func fetchLikeTweets() {
        
        var tweets = [Tweet]()
        
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            
            let tweetIDS = documents.map({ $0.documentID})
            
            tweetIDS.forEach { id in
                
                COLLECTION_TWEETS.document(id).getDocument { snapshot, _ in
                    
                    guard let data = snapshot?.data() else { return }
                    let tweet = Tweet(dictionary: data)
                    tweets.append(tweet)
                    guard tweets.count == tweetIDS.count else { return }
                    self.likedTweets = tweets
                }
            }
        }
    }
}
