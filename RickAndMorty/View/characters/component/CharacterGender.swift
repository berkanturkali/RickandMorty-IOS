//

import SwiftUI

struct CharacterGender: View {
    
    let gender: Gender
    
    var font: Font = .subheadline
    
    var body: some View {
        HStack(spacing: 8) {
            Text(gender.icon)
            Text(gender.localizedDescription)
        }
        .font(font)
        .foregroundColor(Color.onBackground)
        .fontWeight(.medium)
    }
}

#Preview {
    CharacterGender(gender: Gender.male)
}
