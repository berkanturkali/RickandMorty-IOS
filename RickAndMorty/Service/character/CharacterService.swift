//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import Foundation

struct CharacterService {
    
    static let shared = CharacterService()
    
    private init() {}
    
    
    func fetchCharacters() async throws -> BaseApiResponse<CharacterResponse> {
        
        let urlString = Constants.charactersEndpoint
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL(urlString)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let characters = try JSONDecoder().decode(BaseApiResponse<CharacterResponse>.self, from: data)
            return characters
        } catch {
            throw NetworkError.requestFailed(error.localizedDescription)
        }
    }
    
}
