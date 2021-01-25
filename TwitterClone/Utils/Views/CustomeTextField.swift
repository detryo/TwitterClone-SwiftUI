//
//  CustomeTextField.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 21/01/2021.
//

import SwiftUI

struct CustomeTextField: View {
    
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
       
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            
            
            HStack(spacing: 16) {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                TextField("", text: $text)
            }
        }
    }
}

struct CustomeTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomeTextField(text: .constant(""), placeholder: Text(""))
    }
}
