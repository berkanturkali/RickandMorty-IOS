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
    
    static var firstSeenIn: String {
        return localizedString(for: "first_seen_in")
    }
    
    static var genderFilterTitle: String {
        return localizedString(for: "gender_filter_title")
    }
    
    static var genderMale: String {
        return localizedString(for: "gender_male")
    }
    
    static var genderFemale: String {
        return localizedString(for: "gender_female")
    }
    
    static var genderUnknown: String {
        return localizedString(for: "gender_unknown")
    }
    
    static var statusFilterTitle: String {
        return localizedString(for: "status_filter_title")
    }
    
    static var statusAlive: String {
        return localizedString(for: "status_alive")
    }
    
    static var statusDead: String {
        return localizedString(for: "status_dead")
    }
    
    static var statusUnknown: String {
        return localizedString(for: "status_unknown")
    }
    
    static func localizedString(for key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
