//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import SwiftUI

struct CharacterView: View {
    let character: CharacterResponse
    var body: some View {
        
        
        HStack(spacing: 12) {
            CharacterImage(imageUrl: character.image)
                .frame(width: 100)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            
            VStack(alignment: .leading, spacing: 4) {
                CharacterName(
                    name: character.name ?? ""
                )
                
                if let statusAndSpecies = character.statusAndSpecies {
                    CharacterStatus(
                        status: statusAndSpecies,
                        statusColor: character.statusColor
                    )
                }
                
                if let location = character.location?.name {
                    LastKnownLocationSection(lastKnownLocation: location)
                }
                
                if let origin = character.origin?.name {
                    FirstSeenIn(firstSeenIn: origin)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
        }
        .padding(.horizontal)
        .frame(height: 160)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 1)
        )
        
    }
}

#Preview {
    CharacterView(character: CharacterResponse.mockCharacter)
}
