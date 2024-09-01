//
//  LocalizedStrings.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import Foundation

struct LocalizedStrings {
    
    static var characters: String {
        localizedString(for: "characters")
    }
    
    static var locations: String {
        localizedString(for: "locations")
    }
    
    static var episodes: String {
        localizedString(for: "episodes")
    }
    
    static var favorites: String {
        localizedString(for: "favorites")
    }
    
    static var unknownNetworkErrorMessage: String {
        localizedString(for: "unknown_network_exception_message")
    }
    
    static var invalidURLErrorMessage: String {
        localizedString(for: "invalid_url_error_message")
    }
    
    static var lastKnownLocation: String {
        localizedString(for: "last_known_location")
    }
    
    static var firstSeenIn: String {
        localizedString(for: "first_seen_in")
    }
    
    static var genderFilterTitle: String {
        localizedString(for: "gender_filter_title")
    }
    
    static var genderMale: String {
        localizedString(for: "gender_male")
    }
    
    static var genderFemale: String {
        localizedString(for: "gender_female")
    }
    
    static var genderUnknown: String {
        localizedString(for: "gender_unknown")
    }
    
    static var statusFilterTitle: String {
        localizedString(for: "status_filter_title")
    }
    
    static var statusAlive: String {
        localizedString(for: "status_alive")
    }
    
    static var statusDead: String {
        localizedString(for: "status_dead")
    }
    
    static var statusUnknown: String {
        localizedString(for: "status_unknown")
    }
    
    static var filters: String {
        localizedString(for: "filters")
    }
    
    static var locationTitle: String {
        localizedString(for: "location_title")
    }
    
    static var locationType: String {
        localizedString(for: "location_type")
    }
    
    static func localizedString(for key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
