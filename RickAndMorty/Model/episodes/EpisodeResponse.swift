//
//  EpisodeResponse.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 1.09.2024.
//

import Foundation

struct EpisodeResponse: Codable, Identifiable, Hashable {
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let characters: [String?]
    let url: String?
    let created: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
        case created
    }
}
