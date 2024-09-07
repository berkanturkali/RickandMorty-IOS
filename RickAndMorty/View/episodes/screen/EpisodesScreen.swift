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
        ZStack {
            Color.background.ignoresSafeArea()
            GeometryReader { geometry in
                let isLargeScreen = geometry.size.width > 400
                ZStack {
                    Color.background.ignoresSafeArea()
                    VStack(spacing: 16) {
                        BackButton()
                            .padding(.horizontal)
                        ScrollView {
                            if(isLargeScreen) {
                                let columns = Array(
                                    repeating: GridItem(
                                        .flexible(),
                                        spacing: 10
                                    ),
                                    count: min(
                                        4,
                                        Int(
                                            geometry.size.width / 150
                                        )
                                    )
                                )
                                episodesGridView(columns: columns)
                                
                            } else {
                                episodesListView()
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func episodesGridView(columns: [GridItem]) -> some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel.episodes, id: \.self) { episode in
                EpisodeGridItemView(episode: episode)
            }
        }
    }
    
    func episodesListView() -> some View {
        VStack(spacing: 16) {
            ForEach(viewModel.episodes, id:\.self) { episode in
                EpisodeView(episode: episode)
            }
        }
    }
}

#Preview {
    EpisodesScreen()
}
