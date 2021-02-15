//
//  MessageView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 19/01/2021.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    
    let messages: Message
    
    var body: some View {
        HStack {
            
            if messages.isFromCurrentUser {
                Spacer()
                Text(messages.text)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
            } else {
                
                HStack(alignment: .bottom) {
                    KFImage(URL(string: messages.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(messages.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                    
                }.padding(.horizontal)
                Spacer()
            }
        }
    }
}
