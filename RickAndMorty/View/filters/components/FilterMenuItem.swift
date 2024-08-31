//
//  FilterMenuItem.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import SwiftUI

struct FilterMenuItem: View {
    
    let filterMenu: FilterMenu
    
    let onFilterMenuItemClick: (FilterMenu) -> Void
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text(filterMenu.title)
                    .font(.headline)
                
                Spacer()
                if let name = filterMenu.selectedValue?.name {
                    Text(name)
                        .font(.callout)
                        .foregroundColor(Color.onBackgroundSecondary)
                }
            }
            .fontWeight(.semibold)
            .foregroundColor(Color.onBackground)
            .padding(.horizontal)
            .padding(.vertical, 4)
            Divider()
        }
        .onTapGesture {
            onFilterMenuItemClick(filterMenu)
        }
    }
}

#Preview {
    FilterMenuItem(
        filterMenu: FilterMenu(
            title: LocalizedStrings.statusFilterTitle,
            selectedValue: FilterItem.mockFilterItem,
            filters: []
            
        ),
        onFilterMenuItemClick: { _ in }
    )
}
