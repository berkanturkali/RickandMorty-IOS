//
//  CharacterImage.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterImage: View {
    
    let imageUrl: String?
    
    let imageHeight: CGFloat = 150
    
    var body: some View {
        
        if let imageUrl {
            let url = URL(string: imageUrl)
            WebImage(url: url)
                .resizable()
                .indicator(.activity)
                .frame(height: imageHeight)
                .aspectRatio(contentMode: .fill)
            
        } else {
            Image(systemName: "photo")
                .frame(height: imageHeight)
                .scaledToFit()
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
