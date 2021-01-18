//
//  UserCell.swift
//  TwitterClone
//
//  Created by Cristian Sedano Arenas on 18/01/2021.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        
        HStack(spacing: 12) {
            Image("venom-10")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 55, height: 55)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Venom")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Eddie Brack")
                    .font(.system(size: 14))
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
