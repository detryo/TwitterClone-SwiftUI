//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 12/01/2021.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
