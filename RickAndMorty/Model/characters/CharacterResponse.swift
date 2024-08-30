//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import Foundation

struct CharacterResponse: Codable, Identifiable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin?
    let image: String?
    let episode: [String?]
    let url: String?
    let created: String?
    
    struct Origin: Codable {
        let name: String?
        let url: String?
    }
    
    
}
