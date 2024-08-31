//
//  Statusa.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import Foundation

enum StatusFilter: CaseIterable {
    case alive
    case dead
    case unknown
    
    
    var localizedDescription: String {
        switch self {
        case .alive:
            return LocalizedStrings.statusAlive
        case .dead:
            return LocalizedStrings.statusDead
        case .unknown:
            return LocalizedStrings.statusUnknown
        }
    }
    
    static var statusFilters: [FilterItem] {
        let filters =  StatusFilter.allCases.map { status in
            return FilterItem(name: status.localizedDescription, value: "\(status)")
        }
        return filters
    }
}
