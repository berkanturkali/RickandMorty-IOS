//

import SwiftUI

struct ErrorView: View {
    
    @Environment(\.isLargeScreen) private var isLargeScreen
    
    let errorMessage: String
    
    var body: some View {
        VStack {
            Text(errorMessage)
                .font(isLargeScreen ? .largeTitle : .title3)
                .foregroundColor(Color.onBackground)
                .bold()
                .lineLimit(4)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button {
                
            } label: {
                Text("")
            }

        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    ErrorView(errorMessage: "Something went wrong!")
}
