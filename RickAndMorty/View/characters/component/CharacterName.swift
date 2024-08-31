//
//  CharacterName.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import SwiftUI

struct CharacterName: View {
    
    let name: String
    
    var body: some View {
        Text(name)
            .foregroundColor(Color.onBackground)
            .bold()
            .font(.headline)
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    CharacterName(name: "Garment District Rick")
}
