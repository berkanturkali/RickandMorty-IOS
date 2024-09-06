//
//  CharacterStatus.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import SwiftUI

struct CharacterStatus: View {
    
    let status: String
    let statusColor: Color
    
    var alignment: Alignment = .leading
    
    var font: Font = .subheadline
    
    var body: some View {
        HStack {
            if(statusColor != Color.clear) {
                Circle()
                    .fill(statusColor)
                    .frame(width: 10, height: 10)
            }
            
            Text(status)
                .foregroundColor(Color.onBackground)
                .multilineTextAlignment(.center)
            
        }
        .font(font)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: alignment)
    }
}

#Preview {
    CharacterStatus(status: "Dead - Alien", statusColor: Color.aliveStatus)
}
