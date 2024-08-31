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
        GeometryReader { geometry in
            ZStack {
                Color.background.ignoresSafeArea()
                ScrollView {
                    if(geometry.size.width > 400) {
                        let columns = Array(
                            repeating: GridItem(
                                .flexible(),
                                spacing: 20
                            ),
                            count: min(
                                5,
                                Int(
                                    geometry.size.width / 150
                                )
                            )
                        )
                        characterGridView(columns: columns)
                        
                    } else {
                        characterVerticalListView()
                    }
                }
                .padding(.horizontal, 4)
                .scrollIndicators(.hidden)
            }
        }
    }
    
    func characterGridView(columns: [GridItem]) -> some View {
        LazyVGrid(columns: columns, spacing: 24) {
            ForEach(viewModel.characters, id: \.self) { character in
                CharacterGridViewItem(character: character)
            }
        }
    }
    
    func characterVerticalListView() -> some View {
        LazyVStack(spacing: 16) {
            ForEach(viewModel.characters, id:\.self) { character in
                CharacterView(character: character)
            }
        }
    }
}

#Preview {
    CharactersScreen()
}
