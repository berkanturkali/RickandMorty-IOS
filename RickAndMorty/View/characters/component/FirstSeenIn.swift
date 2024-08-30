//
//  FirstSeenIn.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import SwiftUI

struct FirstSeenIn: View {
    
    let firstSeenIn: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(LocalizedStrings.firstSeenIn)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color.backgroundSecondary)
            
            Text(
                firstSeenIn
            )
            .font(.callout)
            .foregroundColor(Color.onBackground)
            
        }
    }
}

#Preview {
    FirstSeenIn(firstSeenIn: "Total Rickall")
}
