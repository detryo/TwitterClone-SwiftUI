//
//  LogInView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 21/01/2021.
//

import SwiftUI

struct LogInView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    Image("TwitterLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                        .padding(.top, 88)
                        .padding(.bottom, 32)
                    
                    VStack(spacing: 20) {
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
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {}, label: {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .foregroundColor(.white)
                                .bold()
                                .padding(.top, 16)
                                .padding(.trailing, 32)
                        })
                    }
                    
                    Button(action: {}, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 310, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: RegistrationView().navigationBarBackButtonHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                
                                Text("Sign Up")
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
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
