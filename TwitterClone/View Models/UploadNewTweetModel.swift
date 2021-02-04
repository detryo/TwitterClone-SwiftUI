//
//  UploadNewTweetModel.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 04/02/2021.
//

import SwiftUI
import Firebase

class UploadNewTweetModel: ObservableObject {
    
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadTweet(caption: String) {
                
        guard let user = AuthViewModel.shared.user else { return }
        
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String : Any] = ["uid": user.id,
                                    "caption": caption,
                                    "fullname": user.fullname,
                                    "timestamp": Timestamp(date: Date()),
                                    "username": user.username,
                                    "profileImageURL": user.profileImageURL,
                                    "likes": 0,
                                    "id": docRef.documentID]
        
        docRef.setData(data) { _ in
            
            print("DEBUG: Successfully uploaded tweet")
            self.isPresented = false
        }
    }
}
