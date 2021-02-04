//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 26/01/2021.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    static let shared = AuthViewModel()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func logIn(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error =  error {
                // TO DO: I need a UIAlertController
                print("Error: failed to Log In \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func signOut() {
        userSession = nil
        user = nil
        try? Auth.auth().signOut()
        print("DEBUG: signOut ")
    }
    
    func fetchUser() {
        
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            
            guard let data = snapshot?.data() else { return }
            self.user = User(dictionary: data)
        }
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        
        let filename = NSUUID().uuidString
        let strongRef = Storage.storage().reference().child(filename)
        
        strongRef.putData(imageData, metadata: nil) { _, error in
            
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            strongRef.downloadURL { url, _ in
                
                guard let profileImageURL = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
                    if let error = error {
                        print("DEBUG: Error \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "username": username.lowercased(),
                                "fullname": fullname,
                                "profileImageURL": profileImageURL,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { (error) in
                        
                        if let error = error {
                            print("DEBUG: Error \(error.localizedDescription)")
                            return
                        }
                        
                        self.userSession = user
                        self.fetchUser()
                        print("DEBUG: Successfully upload user data")
                    }
                }
            }
        }
    }
}
