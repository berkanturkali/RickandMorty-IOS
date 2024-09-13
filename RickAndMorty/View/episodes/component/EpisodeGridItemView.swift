//

import SwiftUI

struct EpisodeGridItemView: View {
    
    let episode: EpisodeResponse
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(systemName: "movieclapper")
                .font(.title2)
                .foregroundColor(Color.accentColor)
                .padding(24)
                .overlay {
                    Circle()
                        .fill(Color.clear)
                        .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1)
                        .background(Color.clear)
                }
            
            Group {
                if let name = episode.name {
                    sectionText(text: name)
                }
                
                if let date = episode.airDate {
                    sectionText(text: date)
                }
                
                if let episode = episode.episode {
                    sectionText(text: episode)
                }
            }
            .padding(.horizontal)
            
        }
        .padding(.vertical, 24)
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.clear)
                .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1)
                .background(Color.clear)
                .cornerRadius(20)
        }
        
        .padding(.horizontal, 4)
        
        
        
        
    }
    
    func sectionText(text: String) -> some View {
        Text(text)
            .font(.callout)
            .fontWeight(.semibold)
            .lineLimit(2)
            .foregroundColor(Color.onBackground)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    EpisodeGridItemView(episode: EpisodeResponse.mockEpisode)
}
