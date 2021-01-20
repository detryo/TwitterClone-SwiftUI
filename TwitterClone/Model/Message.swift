//
//  Message.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 19/01/2021.
//

import Foundation

struct MockMessage: Identifiable {
    
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [ .init(id: 0, imageName: "spiderman", messageText: "Hey whats up", isCurrentUser: false),
                                     .init(id: 1, imageName: "batman", messageText: "Hey whats up!!!", isCurrentUser: true),
                                     .init(id: 2, imageName: "spiderman", messageText: "Hey whats up", isCurrentUser: false)]
