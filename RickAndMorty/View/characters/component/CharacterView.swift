//

import SwiftUI

struct CharacterView: View {
    let character: CharacterResponse
    var body: some View {
        
        ZStack {
            RoundedRectangleBackground()
            
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
        }
        .frame(height: 160) 

        
    }
}

#Preview {
    CharacterView(character: CharacterResponse.mockCharacter)
}
