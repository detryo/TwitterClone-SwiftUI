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
                                "userName": userName,
                                "fullName": fullName,
                                "profileImageURL": profileImageURL,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        
                        print("DEBUG: Successfully upload user data")
                    }
                }
            }
        }
    }
}
