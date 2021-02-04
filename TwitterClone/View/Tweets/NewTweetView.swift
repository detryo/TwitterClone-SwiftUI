//
//  NewTweetView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 20/01/2021.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    @Binding var isPressented: Bool
    @State var captionText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageURL))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
                    TextArea("What's happening", text: $captionText)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading: Button(action: { isPressented.toggle()}, label: {
                    
                    Text("Cancel")
                        .foregroundColor(.blue)
                }),
                trailing:  Button(action: {}, label: {
                    Text("Tweet")
                        .padding(.horizontal)
                    padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
            }))
                Spacer()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPressented: .constant(true))
    }
}
