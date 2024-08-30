//
//  LastKnownLocationSection.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import SwiftUI

struct LastKnownLocationSection: View {
    
    let lastKnownLocation: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(LocalizedStrings.lastKnownLocation)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color.backgroundSecondary)
            
            Text(
                lastKnownLocation
            )
            .font(.callout)
            .foregroundColor(Color.onBackground)
            
        }
    }
}

#Preview {
    LastKnownLocationSection(lastKnownLocation: "Earth (Replacement Dimension)")
}
