//
//  FeedView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 14/01/2021.
//

import SwiftUI

struct FeedView: View {
    
    @State var isShowingNewTweet = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                VStack {
                    ForEach(0..<10) { _ in
                        TweetCell()
                    }
                }.padding()
            }
            
            Button(action: { isShowingNewTweet.toggle()
                
            }, label: {
                Image("Tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweet) {
                NewTweetView(isPressent: $isShowingNewTweet)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
