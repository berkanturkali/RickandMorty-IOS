//

import SwiftUI

struct DetailsHorizontalSection<Content: View>: View {
    
    let title: String
    
    var font: Font = .title3
    
    let content: () -> Content
    
    var body: some View {
        HStack {
            Text(title)
                .font(font)
                .foregroundColor(Color.onBackground)
                .bold()
            
            Spacer()
            
            content()
        }
        .padding(.horizontal)
    }
}
