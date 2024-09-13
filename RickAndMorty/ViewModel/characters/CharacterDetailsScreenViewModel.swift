//

import Foundation
import SwiftData

@MainActor
class CharacterDetailsScreenViewModel: ObservableObject {
    
    @Published var episodes: [EpisodeResponse] = []
    @Published var favorited: Bool = false
    
    private let episodeService = EpisodeService.shared
    
    func fetchEpisode(episodeId: String) async {
        do {
            let episode =  try await episodeService.fetchEpisode(id: episodeId)
            episodes.append(episode)
        } catch {
            
        }
    }
    
    func addToFavorites(context: ModelContext, character: CharacterResponse) {
        let characterEntity = character.mapToCharacterEntity()
        context.insert(characterEntity)
    }
    
    func removeFromFavorites(context: ModelContext, character: CharacterResponse) {
        let fetchDecriptor = FetchDescriptor<CharacterEntity>(predicate: #Predicate { $0.id == character.id! })
        do {
            let results = try context.fetch(fetchDecriptor)
            
            if let entity = results.first {
                context.delete(entity)
                try context.save()
            }
        } catch {
            print("Error deletin character \(error)")
        }
    }
}


