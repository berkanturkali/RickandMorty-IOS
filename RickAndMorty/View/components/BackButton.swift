//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.isLargeScreen) private var isLargeScreen
    
    var body: some View {
        Image(systemName: "chevron.left")
            .font(isLargeScreen ? .largeTitle : .title3)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .background(Color.onBackground.opacity(0.15))
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.onBackground)
            .onTapGesture {
                dismiss()
            }
    }
}

#Preview {
    BackButton()
}
