//
//  FilterMenuScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import SwiftUI

struct FilterMenuScreen: View {
    
    let filterMenu:[FilterMenu]
    
    @State var isCheckMarkActive: Bool = false
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ZStack {
                    BackButton()
                    
                    Image(systemName: "checkmark")
                        .foregroundColor(isCheckMarkActive ? Color.accentColor : Color.onBackgroundSecondary)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    
                    Text(LocalizedStrings.filters)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.onBackground)
                    
                }
                .padding(.horizontal)
                ForEach(filterMenu.indices, id: \.self) { index in
                    FilterMenuItem(filterMenu: filterMenu[index]) { menu in
                        // navigate to filter detail screen
                    }
                }
            }
        }
    }
}

#Preview {
    FilterMenuScreen(
        filterMenu: CharacterFilters.filters
    )
}
