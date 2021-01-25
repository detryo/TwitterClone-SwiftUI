//
//  ProfileHeader.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 20/01/2021.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        
        VStack {
            Image("venom-10")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
            
            Text("Bruce Wayne")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("Batman")
            font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Dark Knight")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            HStack(spacing: 40) {
                VStack {
                    Text("12")
                        .font(.system(size: 16)).bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("14")
                        .font(.system(size: 16)).bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }.padding()
            
            ProfileActionButtonView(isCurrentUser: false)
            
            Spacer()
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
