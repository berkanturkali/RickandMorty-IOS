//
//  BackButton.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        Image(systemName: "chevron.left")
            .padding(8)
            .background(Color.onBackground.opacity(0.15))
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.onBackground)
    }
}

#Preview {
    BackButton()
}
