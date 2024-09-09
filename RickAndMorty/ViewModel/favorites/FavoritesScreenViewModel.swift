//
//  FavoritesScreenViewModel.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 9.09.2024.
//

import Foundation
import SwiftData

@MainActor
class FavoritesScreenViewModel: ObservableObject {
    
    @Published var favorites: [CharacterResponse] = []
    
    
    func fetchFavorites(context: ModelContext) {
        let fetchDescriptor = FetchDescriptor<CharacterEntity>()
        do {
            let entities = try context.fetch(fetchDescriptor)
            
            favorites = entities.map { CharacterEntity.mapToCharacter($0)()}
            
        } catch {
            print("failed to fetch favorites \(error)")
        }
    }
    
    func removeFromFavorites(context: ModelContext, character: CharacterResponse) {
        let fetchDecriptor = FetchDescriptor<CharacterEntity>(predicate: #Predicate { $0.id == character.id! })
        do {
            let results = try context.fetch(fetchDecriptor)
            
            if let entity = results.first {
                context.delete(entity)
            }
        } catch {
            print("Error deletin character \(error)")
        }
    }
    
}
