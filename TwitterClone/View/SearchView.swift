//
//  SearchView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 14/01/2021.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack {
                ForEach(0..<10) { _ in
                    Text("Add users here")
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
