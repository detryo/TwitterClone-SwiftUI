//
//  Message.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 19/01/2021.
//

import Firebase

struct Message: Identifiable {
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String
    
    var chatPartnerId: String { return isFromCurrentUser ? toId : fromId }

    init(user: User, dictionary: [String: Any]) {
        self.user = user
        
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
    }
}

struct MockMessage: Identifiable {
    
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [ .init(id: 0, imageName: "spiderman", messageText: "Hey whats up", isCurrentUser: false),
                                     .init(id: 1, imageName: "batman", messageText: "Hey whats up!!!", isCurrentUser: true),
                                     .init(id: 2, imageName: "spiderman", messageText: "Hey whats up", isCurrentUser: false)]
