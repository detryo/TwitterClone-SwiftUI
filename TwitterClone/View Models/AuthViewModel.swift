//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 26/01/2021.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    func logIn() {
        
        
    }
    
    func registerUser(email: String, password: String, userName: String, fullName: String, profileImage: UIImage) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                // TO DO: I need an UIAlertController for any error
                debugPrint("Error: \(error.localizedDescription)")
                return
            }
            
            print("Success sign in new user")
        }
    }
}
