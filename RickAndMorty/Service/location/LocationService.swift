//
//  LocationService.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 1.09.2024.
//

import Foundation

struct LocationService {
    static let shared = LocationService()
    
    private init() {}
    
    func fetchLocations() async throws -> BaseApiResponse<String> {
        
    }
}
