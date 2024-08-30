//
//  LocalizedStrings.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import Foundation

struct LocalizedStrings {
    
    static var characters: String {
        return localizedString(for: "characters")
    }
    
    static var locations: String {
        return localizedString(for: "locations")
    }
    
    static var episodes: String {
        return localizedString(for: "episodes")
    }
    
    static var favorites: String {
        return localizedString(for: "favorites")
    }
    
    static var unknownNetworkErrorMessage: String {
        return localizedString(for: "unknown_network_exception_message")
    }
    
    static var invalidURLErrorMessage: String {
        return localizedString(for: "invalid_url_error_message")
    }
    
    static var lastKnownLocation: String {
        return localizedString(for: "last_known_location")
    }
    
    static func localizedString(for key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
