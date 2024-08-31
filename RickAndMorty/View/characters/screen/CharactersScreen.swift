//
//  CharactersScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import SwiftUI

struct CharactersScreen: View {
    
    @StateObject var viewModel = CharactersScreenViewModel()
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.characters, id:\.self) { character in
                        CharacterView(character: character)
                    }
                }
            }
            .padding(.horizontal, 4)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CharactersScreen()
}
