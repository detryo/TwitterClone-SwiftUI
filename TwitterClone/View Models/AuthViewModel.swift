//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 26/01/2021.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func logIn(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error =  error {
                // TO DO: I need a UIAlertController
                print("Error: failed to Log In \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
        print("DEBUG: signOut ")
    }
    
    func registerUser(email: String, password: String, userName: String, fullName: String, profileImage: UIImage) {
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.2) else { return }
        
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            
            if let error =  error {
                // TO DO: I need a UIAlertController
                debugPrint("Error: failed to upload image \(error.localizedDescription)")
                return
            }
            print("DEBUG: Successfully upload user photo")
            
            storageRef.downloadURL { url, _ in
                
                guard let profileImageURL = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
                    if let error = error {
                        // TO DO: I need an UIAlertController for any error
                        debugPrint("Error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "userName": userName.lowercased(),
                                "fullName": fullName,
                                "profileImageURL": profileImageURL,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        
                        self.userSession = user
                        print("DEBUG: Successfully upload user data")
                    }
                }
            }
        }
    }
}
