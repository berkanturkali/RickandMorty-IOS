//

import SwiftUI

struct FirstSeenIn: View {
    
    let firstSeenIn: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(LocalizedStrings.firstSeenIn)
                .fontWeight(.semibold)
                .foregroundColor(Color.onBackgroundSecondary)
            
            Text(
                firstSeenIn
            )
            .foregroundColor(Color.onBackground)
            
        }
        .font(.subheadline)
    }
}

#Preview {
    FirstSeenIn(firstSeenIn: "Total Rickall")
}
