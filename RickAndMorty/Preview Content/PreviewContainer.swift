//
//  PreviewContainer.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 10.09.2024.
//

import Foundation
import SwiftData

struct Preview {
    let container: ModelContainer
    
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            container = try ModelContainer(for: CharacterEntity.self, configurations: config)
        } catch {
            fatalError("Could not creater preview container")
        }
    }
    
    func addCharacter(character:CharacterResponse) {
        Task { @MainActor in
            container.mainContext.insert(character.mapToCharacterEntity())
        }
    }
}
