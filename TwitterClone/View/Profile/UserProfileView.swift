//
//  UserProfileView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 20/01/2021.
//

import SwiftUI

struct UserProfileView: View {
    
    @State private var selectedFilter: TweetFilterOptions = .tweets
    
    var body: some View {
       
        ScrollView {
            
            VStack {
                ProfileHeaderView()
                    .padding()
                
                FilterButtonView(selectedOptions: $selectedFilter)
                    .padding()
                
                ForEach(0..<9) { tweet in
                    TweetCell()
                }
            }
            .navigationTitle("Batman")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
