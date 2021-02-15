//
//  SearchViewModel.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 01/02/2021.
//

import SwiftUI
import Firebase

enum SeachViewModelConfiguration {
    
    case search
    case newMessage
}

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    private var config: SeachViewModelConfiguration
    
    init(config: SeachViewModelConfiguration) {
        
        self.config = config
        fetchUsers(forConfif: config)
    }
    
    func fetchUsers(forConfif config: SeachViewModelConfiguration) {
        
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            let users = documents.map({ User(dictionary: $0.data()) })
            
            switch config {
            
            case .newMessage:
                self.users = users.filter({ !$0.isCurrentUser })
                
            case .search:
                self.users = users
            }
        }
    }
    
    func filterUsers(_ query: String) -> [User] {
        
        let lowercaseQuery = query.lowercased()
        
        return users.filter({ $0.fullname.lowercased().contains(lowercaseQuery) || $0.username.contains(lowercaseQuery) })
    }
}
