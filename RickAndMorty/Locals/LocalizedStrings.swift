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
    
    static var episodeName: String {
        localizedString(for: "episode_name_title")
    }
    
    static var episode: String {
        localizedString(for: "episode_title")
    }
    
    static var episodeDate: String {
        localizedString(for: "episode_date_title")
    }
    
    static var seeAll: String {
        localizedString(for: "see_all")
    }
    
    static var nothingHere: String {
        localizedString(for: "nothing_here")
    }
    
    static var failedToDecodeErrorMessage: String {
        localizedString(for: "failed_to_decode_error_message")
    }
    
    static var rest: String {
        localizedString(for: "rest")
    }
    
    static var graphql: String {
        localizedString(for: "graphql")
    }
    
    static var apiTypes: String {
        localizedString(for: "api_types")
    }
    
    static func localizedString(for key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
}
