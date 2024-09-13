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
