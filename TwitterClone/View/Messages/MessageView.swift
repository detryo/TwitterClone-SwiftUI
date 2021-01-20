//
//  MessageView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 19/01/2021.
//

import SwiftUI

struct MessageView: View {
    
    let messages: MockMessage
    
    var body: some View {
        HStack {
            
            if messages.isCurrentUser {
                Spacer()
                Text(messages.messageText)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
            } else {
                
                HStack(alignment: .bottom) {
                    Image(messages.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(messages.messageText)
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


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(messages: MOCK_MESSAGES[0])
    }
}
