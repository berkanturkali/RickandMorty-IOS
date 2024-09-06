//
//  CharacterGridItem.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import SwiftUI

struct CharacterGridViewItem: View {
    
    let character: CharacterResponse
    
    var body: some View {
        ZStack {
            RoundedRectangleBackground()
            
            VStack(spacing: 12) {
                
                CharacterImage(imageUrl: character.image)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                if let name = character.name {
                    CharacterName(name: name)
                }
                
                if let statusAndSpecies = character.statusAndSpecies {
                    CharacterStatus(status: statusAndSpecies, statusColor: character.statusColor, alignment: .center)
                    
                }
            }
            .padding(.vertical)
        }
        .frame(height: 200)
    }
}

#Preview {
    CharacterGridViewItem(character: CharacterResponse.mockCharacter)
}

