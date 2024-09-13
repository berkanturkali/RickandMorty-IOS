//

import SwiftUI

struct EpisodeView: View {
    
    let episode: EpisodeResponse
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "movieclapper")
                .font(.title2)
                .foregroundColor(Color.accentColor)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            
            if let name = episode.name {
                TitleAndDescription(title: LocalizedStrings.episodeName, description: name)
            }
            
            if let date = episode.airDate {
                TitleAndDescription(title: LocalizedStrings.episodeDate, description: date)
            }
            
            if let episode = episode.episode {
                TitleAndDescription(title: LocalizedStrings.episode, description: episode)
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
    EpisodeView(
        episode: EpisodeResponse.mockEpisode
    )
}
