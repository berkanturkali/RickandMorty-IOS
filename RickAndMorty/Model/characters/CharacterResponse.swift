//

import Foundation
import SwiftUI


struct CharacterResponse: Codable, Identifiable, Hashable {
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin: Origin?
    var location: Location?
    var image: String?
    var episode: [String?]
    var url: String?
    var created: String?
    
    
    struct Origin: Codable, Hashable {
        var name: String?
        let url: String?
    }
    
    struct Location: Codable, Hashable {
        var name: String?
        let url: String?
    }
    
    
    var statusAsEnum: Status? {
        if let status {
            return Status(from: status)
        } else {
            return nil
        }
    }
    
    var statusAndSpecies: String? {
        switch (status, species) {
        case let (status?, species?):
            return "\(status) - \(species)"
        case let (status?, nil):
            return status
        case let (nil, species?):
            return species
        default:
            return nil
        }
    }
    
    var statusColor: Color {
        switch statusAsEnum {
        case .alive:
            return Color.aliveStatus
        case .dead:
            return Color.deadStatus
        default:
            return Color.clear
        }
    }
    
    var characterGender: Gender? {
        if let gender = self.gender {
            return  Gender.mapStringGenderToThis(gender: gender)
        }
        return nil
    }
    
    static var mockCharacter: CharacterResponse {
        return CharacterResponse(
            id:
                1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: Origin(
                name: "Earth",
                url: ""
            ),
            location: Location(
                name: "Earth",
                url: ""
            ),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2",
                "https://rickandmortyapi.com/api/episode/3",
                "https://rickandmortyapi.com/api/episode/4",
                "https://rickandmortyapi.com/api/episode/5",
                "https://rickandmortyapi.com/api/episode/6",
                "https://rickandmortyapi.com/api/episode/7",
                "https://rickandmortyapi.com/api/episode/8",
                "https://rickandmortyapi.com/api/episode/9",
            ],
            url: nil,
            //            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
    }
    
    
    func mapToCharacterEntity() -> CharacterEntity {
        return CharacterEntity(
            id: self.id!,
            name: self.name,
            status: self.status,
            species: self.species,
            origin: OriginEntity(
                name: self.origin?.name
            ),
            location: LocationEntity(
                name: self.location?.name
            ),
            image: self.image
        )
    }
    
    
    
}
