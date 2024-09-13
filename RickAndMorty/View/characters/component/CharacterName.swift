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
