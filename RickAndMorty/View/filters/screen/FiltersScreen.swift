//
//  FiltersScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import SwiftUI

struct FiltersScreen: View {
    
    @Environment(
        \.dismiss
    ) private var dismiss
    
    @StateObject var viewModel = FiltersScreenViewModel()
    
    @State var isCheckMarkActive: Bool = false
    @State var selectedFilters: [FilterItem] = []
    let title: String
    let filters: [FilterItem]
    
    let previousSelectedItems: [FilterItem]
    
    
    let onApplyButtonClick: (
        [FilterItem]
    ) -> Void
    
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView {
                LazyVStack {
                    ZStack {
                        BackButton()
                        
                        Image(
                            systemName: "checkmark"
                        )
                        .foregroundColor(
                            viewModel.isCheckMarkActive ? Color.accentColor : Color.onBackgroundSecondary
                        )
                        .frame(
                            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                            alignment: .trailing
                        ).onTapGesture {
                            onApplyButtonClick(
                                selectedFilters
                            )
                            dismiss()
                        }
                        
                        Text(
                            title
                        )
                        .font(
                            .title2
                        )
                        .fontWeight(
                            .bold
                        )
                        .foregroundColor(
                            Color.onBackground
                        )
                        
                    }
                    .padding(
                        .horizontal
                    )
                    ForEach(
                        filters.indices,
                        id: \.self
                    ) { index in
                        FilterItemView(
                            isSelected: setIsSelectedOfFilterItemView(
                                index: index
                            ),
                            filterItem: filters[index]
                        ) { item in
                            
                            if let indexOfTheItem = selectedFilters.firstIndex(where: { $0.name == item.name }) {
                                selectedFilters.remove(at: indexOfTheItem)
                            } else {
                                selectedFilters.append(item)
                            }
                            
                            viewModel.setIsCheckMarkActive(
                                selectedFilters: selectedFilters,
                                previouslySelectedFilters: previousSelectedItems
                            )
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    
    private func setIsSelectedOfFilterItemView(
        index: Int
    ) -> Bool {
        let filterItem = filters[index]
        let set = Set(
            selectedFilters
        )
        return set.contains{
            $0.name == filterItem.name
        }
    }
}

#Preview {
    FiltersScreen(
        title: LocalizedStrings.filters,
        filters: CharacterFilters.filters.first!.filters,
        previousSelectedItems: [],
        onApplyButtonClick: {
            _ in
        }
    )
}
