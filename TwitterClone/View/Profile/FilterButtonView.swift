//
//  FilterButtonView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 20/01/2021.
//

import SwiftUI

enum TweetFilterOptions: Int, CaseIterable{
    
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct FilterButtonView: View {
    
    @Binding var selectedOptions: TweetFilterOptions
    
    private let underLineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilterOptions.allCases.count)
    
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOptions.rawValue)
        let count = CGFloat(TweetFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 16
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                ForEach(TweetFilterOptions.allCases, id: \.self) { option in
                    
                    Button(action: {
                        self.selectedOptions = option
                    }, label: {
                        Text(option.title)
                            .frame(width: underLineWidth - 8)
                    })
                }
            }
            
            Rectangle()
                .frame(width: underLineWidth - 32, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding)
                .animation(.spring())
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(selectedOptions: .constant(.tweets))
    }
}
