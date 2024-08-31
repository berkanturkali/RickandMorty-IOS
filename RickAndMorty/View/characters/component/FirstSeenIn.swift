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
