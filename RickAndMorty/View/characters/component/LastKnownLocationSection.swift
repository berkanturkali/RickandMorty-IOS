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
        VStack(alignment: .leading, spacing: 4) {
            Text(LocalizedStrings.lastKnownLocation)
                .fontWeight(.semibold)
                .foregroundColor(Color.onBackgroundSecondary)
            
            Text(
                lastKnownLocation
            )
            
            .foregroundColor(Color.onBackground)
            
        }
        .font(.subheadline)
    }
}

#Preview {
    LastKnownLocationSection(lastKnownLocation: "Earth (Replacement Dimension)")
}
