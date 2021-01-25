//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 21/01/2021.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email = ""
    @State var password = ""
    @State var fullName = ""
    @State var userName = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
            
        ZStack {
            VStack {
                Image("plus_photo")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFill()
                    .frame(width: 140, height: 140)
                    .padding(.top, 88)
                    .padding(.bottom, 16)
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    
                    CustomeTextField(text: $fullName, placeholder: Text("Full  Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomeTextField(text: $userName, placeholder: Text("User Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomeTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 32)
                
                Button(action: {}, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 310, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                })
            }
        }
        .background(Color(#colorLiteral(red: 0.1128571406, green: 0.6315795779, blue: 0.9542787671, alpha: 1)))
        .ignoresSafeArea()

    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
