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
                LazyVStack {
                    ForEach(viewModel.characters, id:\.self) { character in
                        Text(character.name!)
                    }
                }
            }
        }
    }
}

#Preview {
    CharactersScreen()
}
