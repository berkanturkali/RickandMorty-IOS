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
    
    var body: some View {
        HStack {
            Circle()
                .fill(statusColor)
                .frame(width: 15, height: 15)
            
            Text(status)
                .font(.callout)
                .foregroundColor(Color.onBackground)
        }
    }
}

#Preview {
    CharacterStatus(status: "Dead - Alien", statusColor: Color.aliveStatus)
}
