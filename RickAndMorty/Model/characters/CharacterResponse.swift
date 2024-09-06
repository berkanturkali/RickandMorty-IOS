//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import Foundation
import SwiftUI

struct CharacterResponse: Codable, Identifiable, Hashable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
    let episode: [String?]
    let url: String?
    let created: String?
    
    
    struct Origin: Codable, Hashable {
        let name: String?
        let url: String?
    }
    
    struct Location: Codable, Hashable {
        let name: String?
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
                "https://rickandmortyapi.com/api/episode/2"
            ],
            url: nil,
            //            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
    }
    
    
    
}
