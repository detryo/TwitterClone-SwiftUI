//
//  NewMessageView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 19/01/2021.
//

import SwiftUI

struct NewMessageView: View {
    
    @ObservedObject var viewModel = SearchViewModel(config: .newMessage)
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    @Binding var user: User?
    
    var body: some View {
        
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filterUsers(searchText)) { user in
                    HStack{ Spacer() }
                    
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
                        self.user = user
                        
                    }, label: {
                        UserCell(user: user)
                    })
                }
            }.padding(.leading)
        }
    }
}
