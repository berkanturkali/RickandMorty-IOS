//

import SwiftUI

struct FilterMenuItem: View {
    
    let filterMenu: FilterMenu
    
    let previousFilters: [FilterItem] = []
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text(filterMenu.title)
                    .font(.headline)
                
                Spacer()
                Text(filterMenu.selectedValue?.name ?? "")
                    .font(.callout)
                    .foregroundColor(Color.onBackgroundSecondary)
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
            selectedValue: nil,
            filters: [],
            queryKey: ""
        )
    )
}
