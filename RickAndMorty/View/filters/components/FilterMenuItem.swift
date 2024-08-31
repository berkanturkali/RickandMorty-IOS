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
                    .font(.title3)
                
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
    }
}

#Preview {
    FilterMenuItem(
        filterMenu: FilterMenu(
            title: LocalizedStrings.statusFilterTitle,
            selectedValue: FilterItem.mockFilterItem,
            filters: []
            
        )
    )
}
