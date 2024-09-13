//

import SwiftUI

struct LoadingView: View {
    
    @Environment(\.isLargeScreen) private var isLargeScreen: Bool
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(isLargeScreen ? 3 : 1.5)
    }
}

#Preview {
    LoadingView()
}
