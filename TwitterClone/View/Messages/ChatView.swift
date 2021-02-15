//
//  ChatView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 18/01/2021.
//

import SwiftUI

struct ChatView: View {
    
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    @State var messageText: String = ""
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    
                    ForEach(viewModel.messages) { messages in
                        
                        MessageView(messages: messages)
                    }
                }
            }.padding(.top)
            
            MessagesInputView(messageText: $messageText, action: sendMessage)
                .padding()
            
        }.navigationTitle(user.username)
    }
    
    func sendMessage() {
        
        viewModel.sendMessage(messageText)
    }
}
