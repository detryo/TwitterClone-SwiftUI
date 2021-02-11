//
//  LazyView.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 09/02/2021.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
