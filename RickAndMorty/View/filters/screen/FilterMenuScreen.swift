//
//  FilterMenuScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import SwiftUI

struct FilterMenuScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.isLargeScreen) private var isLargeScreen
    
    @State var filterMenu: [FilterMenu]
    
    @State var isCheckMarkActive: Bool = false
    
    let onApplyButtonClick: ([FilterMenu]) -> Void
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ZStack {
                            BackButton()
                            
                            Image(systemName: "checkmark")
                                .font(isLargeScreen ? .largeTitle : .title2)
                                .foregroundColor(isCheckMarkActive ? Color.accentColor : Color.onBackgroundSecondary)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                                .onTapGesture {
                                    onApplyButtonClick(filterMenu)
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
                                FiltersScreen(selectedFilters: menu.selectedValues,
                                              title: menu.title,
                                              filters: menu.filters,
                                              previousSelectedItems: menu.selectedValues,
                                              onApplyButtonClick: { filters in
                                    isCheckMarkActive = filterMenu[index].selectedValues.map{  $0.name } != filters.map{ $0.name }
                                    filterMenu[index].selectedValues = filters
                                    
                                })
                            } label: {
                                FilterMenuItem(filterMenu: menu)
                            }
                            
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
        filterMenu: CharacterFilters.filters) { _ in
            
        }
}
