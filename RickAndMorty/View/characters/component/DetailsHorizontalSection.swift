//
//  DetailsHorizontalSection.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 6.09.2024.
//

import SwiftUI

struct DetailsHorizontalSection<Content: View>: View {
    
    let title: String
    
    let content: () -> Content
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .foregroundColor(Color.onBackground)
                .bold()
            
            Spacer()
            
            content()
        }
        .padding(.horizontal)
    }
}
