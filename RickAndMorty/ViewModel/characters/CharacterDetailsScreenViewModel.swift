//
//  CharacterDetailsScreenViewModel.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 6.09.2024.
//

import Foundation


@MainActor
class CharacterDetailsScreenViewModel: ObservableObject {
    
    @Published var episodes: [EpisodeResponse] = []
    
    private let episodeService = EpisodeService.shared
    
    
    func fetchEpisode(episodeId: String) async {
        do {
            let episode =  try await episodeService.fetchEpisode(id: episodeId)
            episodes.append(episode)
        } catch {
            
        }
        
    }
    
}
