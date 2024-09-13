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
                TitleAndDescription(title: LocalizedStrings.locationTitle, description: name)
            }
            
            if let locationType = location.type {
                TitleAndDescription(title: LocalizedStrings.locationType, description: locationType)
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
}

#Preview {
    LocationView(
        location: LocationResponse.mockLocation
    )
}
