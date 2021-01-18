//
//  MessagesInputView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 18/01/2021.
//

import SwiftUI

struct MessagesInputView: View {
    
    @Binding var messageText: String
    
    var body: some View {
        
        HStack {
            TextField("message", text: $messageText )
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: {}, label: {
                Text("Send")
            })
                
        }
    }
}

struct MessagesInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesInputView(messageText: .constant("message"))
    }
}
