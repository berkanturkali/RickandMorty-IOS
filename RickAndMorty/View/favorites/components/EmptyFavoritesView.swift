//
//  EmptyFavoritesView.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 9.09.2024.
//

import SwiftUI

struct EmptyFavoritesView: View {
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "star")
                .resizable()
                .frame(width: 200, height: 200)
            
            Text(LocalizedStrings.nothingHere)
                .fontWeight(.semibold)
                .font(.largeTitle)
            
            
        }
        .foregroundColor(Color.onBackground.opacity(0.3))
    }
}

#Preview {
    ZStack {
        Color.background.ignoresSafeArea()
        EmptyFavoritesView()
    }
}
