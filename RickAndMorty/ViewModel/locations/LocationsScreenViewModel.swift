//
//  LocationsScreenViewModel.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 1.09.2024.
//

import Foundation

@MainActor
class LocationsScreenViewModel: ObservableObject {
    
    @Published var locations: [LocationResponse] = []
    
    @Published var isLoading = false
    
    @Published var errorMessage: String? = nil
    
    private let locationsService = LocationService.shared
    
    init() {
        Task {
            await fetchLocations()
        }
    }
    
    func fetchLocations() async {
        isLoading = true
        errorMessage = nil
        do {
            locations = try await locationsService.fetchLocations().results
        } catch {
            errorMessage = ErrorHandler.shared.getErrorMessage(from: error)
        }
        isLoading = false
    }
    
}
