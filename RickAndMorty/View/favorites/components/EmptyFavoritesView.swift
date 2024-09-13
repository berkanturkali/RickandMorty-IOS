//

import SwiftUI

struct EmptyFavoritesView: View {
    
    @Environment(\.isLargeScreen) private var isLargeScreen
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "star")
                .resizable()
                .setImageSize(size: isLargeScreen ? 200 : 100)
            
            Text(LocalizedStrings.nothingHere)
                .fontWeight(.semibold)
                .font(isLargeScreen ? .largeTitle : .title2)
            
            
        }
        .foregroundColor(Color.onBackground.opacity(0.3))
    }
}

extension View {
    func setImageSize(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
}

#Preview {
    ZStack {
        Color.background.ignoresSafeArea()
        EmptyFavoritesView()
    }
}
