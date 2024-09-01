//
//  LocationView.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 1.09.2024.
//

import SwiftUI

struct LocationView: View {
    
    let location: LocationResponse
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "mappin.and.ellipse")
                .font(.title2)
                .foregroundColor(Color.accentColor)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            
            if let name = location.name {
                titleAndDescription(title: LocalizedStrings.locationTitle, description: name)
            }
            
            if let locationType = location.type {
                titleAndDescription(title: LocalizedStrings.locationType, description: locationType)
            }
            
        }
        .padding(.vertical, 24)
        .padding(.horizontal)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.clear)
                .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1)
                .background(Color.clear)
                .cornerRadius(20)
            
        }
        .padding(.horizontal, 4)
    }
    
    
    func titleAndDescription(title: String, description: String) -> some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text(description)
                .bold()
                .font(.callout)
                .lineLimit(2)
            
        }
        .font(.title3)
        .foregroundColor(Color.onBackground)
    }
}

#Preview {
    LocationView(
        location: LocationResponse.mockLocation
    )
}
