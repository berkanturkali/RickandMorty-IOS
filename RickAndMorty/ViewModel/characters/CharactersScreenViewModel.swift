//
//  CharactersScreenViewModel.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import Foundation

@MainActor
class CharactersScreenViewModel: ObservableObject {
    
    @Published var characters: [CharacterResponse] = []
    
    @Published var isLoading = false
    
    @Published var errorMessage: String? = nil
    
    private let charactersService = CharacterService.shared
    
    @Published var filterMenu: [FilterMenu] = CharacterFilters.filters
    
    init() {
        Task {
            await fetchCharacters()
        }
    }
    
    func fetchCharacters() async {
        isLoading = true
        errorMessage = nil
        
        do {
            characters = try await charactersService.fetchCharacters().results
        } catch {
            errorMessage = ErrorHandler.shared.getErrorMessage(from: error)
        }
        
        isLoading = false
    }
    
}
