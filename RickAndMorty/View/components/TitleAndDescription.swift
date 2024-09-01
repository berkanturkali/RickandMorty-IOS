//
//  TitleAndDescription.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 1.09.2024.
//

import SwiftUI

struct TitleAndDescription: View {
    let title: String
    let description: String
    var body: some View {
        HStack {
            Text(title)
                .bold()
            
            Spacer()
            
            Text(description)
                .fontWeight(.semibold)
                .lineLimit(2)
                .foregroundColor(Color.onBackgroundSecondary)
            
        }
        .font(.callout)
        .foregroundColor(Color.onBackground)
    }
}

#Preview {
    TitleAndDescription(title: "Title", description: "Description")
}
