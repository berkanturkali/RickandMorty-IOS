//
//  Gender.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import Foundation

enum Gender: String, CaseIterable {
    
    case male
    case female
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .male:
            return LocalizedStrings.genderMale
        case .female:
            return LocalizedStrings.genderFemale
        case .unknown:
            return LocalizedStrings.genderUnknown
        }
    }
    
    var icon: String {
        switch self {
        case .male: return "⚦"
        case .female: return "♀"
        case .unknown: return "𖡄"
        }
    }
    
    static func mapStringGenderToThis(gender: String) -> Gender {
        Gender(rawValue: gender.lowercased())!
    }
    
    
    static var genderFilters: [FilterItem] {
        return Gender.allCases.map { gender in
            return FilterItem(name: gender.localizedDescription, value: "\(gender)", icon: gender.icon)
        }
    }
}
