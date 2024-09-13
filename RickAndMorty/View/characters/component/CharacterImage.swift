//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterImage: View {
    
    let imageUrl: String?
    
    var body: some View {
        
        if let imageUrl {
            let url = URL(string: imageUrl)
            WebImage(url: url)
                .resizable()
                .scaledToFit()
                .transition(.fade(duration: 0.5))
            
            
        } else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .padding()
                .foregroundColor(.onBackground)
        }
        
    }
}

#Preview {
    VStack {
        CharacterImage(imageUrl: nil)
        CharacterImage(imageUrl: "https://picsum.photos/200/300")
    }
}
