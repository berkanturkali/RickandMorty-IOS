//
//  FilterMenuScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import SwiftUI

struct FilterMenuScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let filterMenu:[FilterMenu]
    
    @State var isCheckMarkActive: Bool = false
    
    @State var selectedFilters:[FilterItem] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ZStack {
                        BackButton()
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(isCheckMarkActive ? Color.accentColor : Color.onBackgroundSecondary)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                            .onTapGesture {
                                // save the filter values to locale
                                dismiss()                                
                            }
                        
                        
                        Text(LocalizedStrings.filters)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.onBackground)
                        
                    }
                    .padding(.horizontal)
                    ForEach(filterMenu.indices, id: \.self) { index in
                        let menu = filterMenu[index]
                        NavigationLink {
                            FiltersScreen(selectedFilters: [],
                                          title: menu.title,
                                          filters: menu.filters,
                                          onApplyButtonClick: { filters in
                                selectedFilters = filters
                            })
                        } label: {
                            FilterMenuItem(filterMenu: menu)
                        }
                        
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FilterMenuScreen(
        filterMenu: CharacterFilters.filters
    )
}
