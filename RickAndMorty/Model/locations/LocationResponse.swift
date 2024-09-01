//
//  LocationResponse.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 1.09.2024.
//

import Foundation

struct LocationResponse: Codable, Identifiable {
    let id: Int?
    let name: String?
    let type: String
    let dimension: String?
    let residents: [String?]
    let url: String?
    let created: String?
}
