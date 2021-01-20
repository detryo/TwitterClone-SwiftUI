//
//  ChatView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 18/01/2021.
//

import SwiftUI

struct ChatView: View {
    
    @State var messageText: String = ""
    
    var body: some View {
        
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    
                    ForEach(MOCK_MESSAGES) { messages in
                        
                        MessageView(messages: messages)
                    }
                }
            }.padding(.top)
            
            MessagesInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
