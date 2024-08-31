//
//  FilterItem.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import SwiftUI

struct FilterItemView: View {
    @State var isSelected: Bool = false
    let filterItem: FilterItem
    
    let onFilterItemClick: (FilterItem) -> Void
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text((filterItem.icon ?? "") + " " + filterItem.name)
                    .font(.callout)
                Spacer()
                
                if(isSelected) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.accentColor)
                }
            }
            
            .padding(.horizontal)
            .padding(.vertical, 4)
            Divider()
        }
        
        .foregroundColor(Color.onBackground)
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            isSelected.toggle()
            onFilterItemClick(filterItem)
        }
    }
}

#Preview {
    FilterItemView(
        filterItem: FilterItem.mockFilterItem
    ) { _ in }
}
