//
//  FiltersScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import SwiftUI

struct FiltersScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var isCheckMarkActive: Bool = false
    @State var selectedFilters: [FilterItem] = []
    let title: String
    let filters: [FilterItem]
    
    let onApplyButtonClick: ([FilterItem]) -> Void
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ZStack {
                    BackButton()
                    
                    Image(systemName: "checkmark")
                        .foregroundColor(isCheckMarkActive ? Color.accentColor : Color.onBackgroundSecondary)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing).onTapGesture {
                            onApplyButtonClick(selectedFilters)
                            dismiss()
                        }
                    
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.onBackground)
                    
                }
                .padding(.horizontal)
                ForEach(filters.indices, id: \.self) { index in
                    FilterItemView(filterItem: filters[index]) { item in
                        let selectedFiltersContainsTheItem = selectedFilters.contains { filterItem in
                            filterItem.name == item.name
                        }
                        if(selectedFiltersContainsTheItem) {
                            let indexOfTheItem = selectedFilters.firstIndex { filterItem in
                                filterItem.name == item.name
                            }
                            selectedFilters.remove(at: indexOfTheItem!)
                        } else {
                            selectedFilters.append(item)
                        }
                        isCheckMarkActive = !selectedFilters.isEmpty
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FiltersScreen(
        title: LocalizedStrings.filters,
        filters: CharacterFilters.filters.first!.filters,
        onApplyButtonClick: { _ in }
    )
}
