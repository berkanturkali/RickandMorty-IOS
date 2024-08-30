//
//  LocalizedStrings.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import Foundation

struct LocalizedStrings {
    
    static var home: String {
        return localizedString(for: "home_tab_view_label")
    }
    
    static var search: String {
        return localizedString(for: "search_tab_view_label")
    }
    
    static var favorites: String {
        return localizedString(for: "favorites_tab_view_label")
    }
    
    static func localizedString(for key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
