//
//  EpisodesScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 1.09.2024.
//

import SwiftUI

struct EpisodesScreen: View {
    
    @StateObject var viewModel = EpisodesScreenViewModel()
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.episodes, id: \.self) { episode in
                        
                }
            }
        }
    }
}

#Preview {
    EpisodesScreen()
}
