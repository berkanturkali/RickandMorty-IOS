//
//  LocationResponse.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 1.09.2024.
//

import Foundation

struct LocationResponse: Codable, Identifiable, Hashable {
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [String?]
    let url: String?
    let created: String?
    
    
    static var mockLocation: LocationResponse {
        LocationResponse(
            id: 1,
            name: "Earth",
            type: "Planet",
            dimension: "Dimension C-137",
            residents: [],
            url: "https://rickandmortyapi.com/api/location/1",
            created: "2017-11-10T12:42:04.162Z"
        )
    }
}
