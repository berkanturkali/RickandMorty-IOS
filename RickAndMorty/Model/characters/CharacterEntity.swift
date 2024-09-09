//
//  CharacterEntity.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 8.09.2024.
//

import Foundation
import SwiftData

@Model
class CharacterEntity  {
    @Attribute(.unique) let id: Int
    let name: String?
    let status: String?
    let species: String?
    @Relationship(deleteRule: .cascade) let origin: OriginEntity
    @Relationship(deleteRule: .cascade) let location: LocationEntity
    let image: String?
    
    init(id: Int, name: String?, status: String?, species: String?, origin: OriginEntity, location: LocationEntity, image: String?) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.origin = origin
        self.location = location
        self.image = image
    }
    
    func mapToCharacter() -> CharacterResponse{
        return CharacterResponse(
            id: id,
            name: name,
            status: status,
            species: species,
            type: nil,
            gender: nil,
            origin: CharacterResponse.Origin(
                name: origin.name,
                url: nil
            ),
            location: CharacterResponse.Location(
                name: location.name,
                url: nil
            ),
            image: image,
            episode: [nil],
            url: nil,
            created: nil
        )
    }
    
}

@Model
class LocationEntity {
    
    @Attribute(.unique) let name: String?
    
    init(name: String? = nil) {
        self.name = name
    }
}

@Model
class OriginEntity {
    @Attribute(.unique) let name: String?
    
    init(name: String?) {
        self.name = name
    }
}
