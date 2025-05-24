//

import SwiftUI

struct ApiTypeItemView: View {
    @Binding var isSelected: Bool
    let item: ApiType
    
    let onItemClick: (ApiType) -> Void
    var body: some View {
        HStack {
            Text(item.displayName)
                .font(.callout)
            
            Spacer()
            
            if(isSelected) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color.accentColor)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
        .foregroundColor(Color.onBackground)
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {
            onItemClick(item)
        }
    }
    
}

#Preview {
    ApiTypeItemView(
        isSelected: .constant(false),
        item: ApiType.rest,
        onItemClick: { _ in
        }
    )
}
