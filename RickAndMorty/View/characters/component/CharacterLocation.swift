//

import SwiftUI

struct CharacterLocation: View {
    let location: String
    var font: Font = .subheadline
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(systemName: "mappin.and.ellipse")
                .font(.title2)
                .foregroundColor(Color.accentColor)
            
            Text(location)
                .font(font)
                .foregroundColor(Color.onBackground)
            
        }
    }
}

#Preview {
    CharacterLocation(location: "Citadel of Ricks")
}
