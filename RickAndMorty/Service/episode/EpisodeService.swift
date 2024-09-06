//
//  EpisodeService.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 1.09.2024.
//

import Foundation

struct EpisodeService {
    
    static let shared = EpisodeService()
    
    private init() {}
    
    
    func fetchEpisodes() async throws -> BaseApiResponse<EpisodeResponse> {
        let urlString = Constants.episodesEndpoint
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL(urlString)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let episodes = try JSONDecoder().decode(BaseApiResponse<EpisodeResponse>.self, from: data)
            return episodes
            
        } catch {
            throw NetworkError.requestFailed(error.localizedDescription)
        }
    }
    
    func fetchEpisode(id: String) async throws -> EpisodeResponse {
        let urlString = Constants.episodesEndpoint + "/\(id)"
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL(urlString)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let episode = try JSONDecoder().decode(EpisodeResponse.self, from: data)
            return episode
        } catch {
            throw NetworkError.requestFailed(error.localizedDescription)
        }
    }
    
}
