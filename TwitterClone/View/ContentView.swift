//
//  ContentView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 12/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                Text("Messages")
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Messages")
                    }
            }
            .navigationBarTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
