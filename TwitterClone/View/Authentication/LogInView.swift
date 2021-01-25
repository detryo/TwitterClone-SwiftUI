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
        
        ZStack {
            VStack {
                Image("TwitterLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                    .padding(.top, 88)
                
                VStack {
                    CustomeTextField(text: $email, placeholder: Text("Email"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding()
                    
                    CustomeTextField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding()
                }
                
                Spacer()
            }
        }
        .background(Color(#colorLiteral(red: 0.1128571406, green: 0.6315795779, blue: 0.9542787671, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
