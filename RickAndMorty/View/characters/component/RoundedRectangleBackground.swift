//

import SwiftUI

struct RoundedRectangleBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.backgroundSecondary)
            .stroke(.gray, lineWidth: 1)
    }
}

#Preview {
    RoundedRectangleBackground()
}
