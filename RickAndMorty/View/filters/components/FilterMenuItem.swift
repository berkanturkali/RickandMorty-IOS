//
//  FilterMenuItem.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import SwiftUI

struct FilterMenuItem: View {
    
    let filterMenu: FilterMenu
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text(filterMenu.title)
                    .font(.headline)
                
                Spacer()
                Text(mapSelectedFiltersToString())
                    .font(.callout)
                    .foregroundColor(Color.onBackgroundSecondary)
            }
            .fontWeight(.semibold)
            .foregroundColor(Color.onBackground)
            .padding(.horizontal)
            .padding(.vertical, 4)
            Divider()
        }
    }
    
    private func mapSelectedFiltersToString() -> String {
        return filterMenu.selectedValues.map({ item in
            item.name
        }).joined(separator: ", ")
    }
}

#Preview {
    FilterMenuItem(
        filterMenu: FilterMenu(
            title: LocalizedStrings.statusFilterTitle,
            selectedValues: [],
            filters: []
        )
    )
}
