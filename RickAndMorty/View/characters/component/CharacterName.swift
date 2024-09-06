//
//  CharacterName.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import SwiftUI

struct CharacterName: View {
    
    let name: String
    
    var font: Font = .headline
    var lineLimit: Int = 2
    
    var body: some View {
        Text(name)
            .foregroundColor(Color.onBackground)
            .bold()
            .font(font)
            .lineLimit(2)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    CharacterName(
        name: "Garment District Rick"
    )
}
