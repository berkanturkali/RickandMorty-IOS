//

import SwiftUI

struct FilterItemView: View {
    @Binding var isSelected: Bool
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
            onFilterItemClick(filterItem)
        }
    }
}

#Preview {
    FilterItemView(
        isSelected: .constant(false),
        filterItem: FilterItem.mockFilterItem
    ) { _ in }
}
