//
//  CharacterGender.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 6.09.2024.
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
