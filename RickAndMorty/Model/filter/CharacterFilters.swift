//
//  CharacterFilters.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import Foundation

struct CharacterFilters {
    
    static var filters: [FilterMenu] {
        var filterMenu: [FilterMenu] = []
        var genderFilterMenu = FilterMenu(title: LocalizedStrings.genderFilterTitle, filters: Gender.genderFilters, queryKey: "gender")
        var statusFilterMenu = FilterMenu(title: LocalizedStrings.statusFilterTitle, filters: StatusFilter.statusFilters, queryKey: "status")
        
        filterMenu.append(contentsOf: [genderFilterMenu, statusFilterMenu])
        return filterMenu
    }
}
