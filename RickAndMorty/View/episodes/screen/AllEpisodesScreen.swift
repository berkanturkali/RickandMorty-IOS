//
//  AllEpisodesScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 7.09.2024.
//

import SwiftUI

struct AllEpisodesScreen: View {
    
    @Binding var episodes: [EpisodeResponse]
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack(spacing: 16) {                
                BackButton()
                    .padding(.horizontal)
                ScrollView {
                    VStack {
                        ForEach(episodes, id: \.self) { episode in
                            EpisodeView(episode: episode)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AllEpisodesScreen(episodes: .constant([]))
}
