//
//  ChatViewModel.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 10/02/2021.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject {
    
    let user: User
    
    @Published var messages = [Message]()
    
    init(user: User) {
        self.user = user
        fechMessages()
    }
    
    func fechMessages() {
        
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid).collection(user.id)
        query.order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            
            changes.forEach { change in
                
                let messageData = change.document.data()
                guard let fromId = messageData["fromId"] as? String else { return }
                
                COLLECTION_USERS.document(fromId).getDocument { snapshot, _ in
                    
                    guard let data = snapshot?.data() else { return }
                    let user = User(dictionary: data)
                    self.messages.append(Message(user: user, dictionary: messageData))
                }
            }
        }
    }
    
    func sendMessage(_ messageText: String) {
        
        guard let currentUID = AuthViewModel.shared.userSession?.uid else { return }
        
        let currentUserRef = COLLECTION_MESSAGES.document(currentUID).collection(user.id).document()
        let recivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUID)
        let messageID = currentUserRef.documentID
        
        let recivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUID).collection("recent-messages")
        
        let data: [String : Any] = ["text": messageText,
                                    "id": messageID,
                                    "fromId": currentUID,
                                    "toId": user.id,
                                    "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        recivingUserRef.document(messageID).setData(data)
        recivingRecentRef.document(currentUID).setData(data)
        currentRecentRef.document(user.id).setData(data)
    }
}
