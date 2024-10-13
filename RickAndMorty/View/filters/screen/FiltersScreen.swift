//

import SwiftUI

struct FiltersScreen: View {
    
    @Environment(
        \.dismiss
    ) private var dismiss
    
    @Environment(\.isLargeScreen) private var isLargeScreen
    
    @StateObject var viewModel = FiltersScreenViewModel()
    
    @State var isCheckMarkActive: Bool = false
    @State var selectedFilter: FilterItem?
    let title: String
    let filters: [FilterItem]
    
    let previousSelectedItem: FilterItem?
    
    
    let onApplyButtonClick: (
        FilterItem?
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
                        .font(isLargeScreen ? .largeTitle : .title3)
                        .frame(
                            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                            alignment: .trailing
                        ).onTapGesture {
                            onApplyButtonClick(
                                selectedFilter
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
                            isSelected: .constant(filters[index].name == selectedFilter?.name),
                            filterItem: filters[index]
                        ) { item in

                            if item.name == selectedFilter?.name {
                                selectedFilter = nil
                            } else {
                                selectedFilter = item
                            }
                            
                            viewModel.setIsCheckMarkActive(
                                selectedFilter: selectedFilter,
                                previouslySelectedFilter: previousSelectedItem
                            )
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {

    FiltersScreen(
        isCheckMarkActive: true,
        title: LocalizedStrings.filters,
        filters: CharacterFilters.filters.first!.filters,
        previousSelectedItem: nil,
        onApplyButtonClick: {
            _ in
        })
}
