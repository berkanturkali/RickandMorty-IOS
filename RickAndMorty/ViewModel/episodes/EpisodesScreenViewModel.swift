//

import Foundation

@MainActor
class EpisodesScreenViewModel: ObservableObject {
    
    @Published var episodes: [EpisodeResponse] = []
    
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String? = nil
    
    private let episodeService = EpisodeService.shared
    
    init() {
        Task {
            await fetchEpisodes()
        }
    }
    
    
    func fetchEpisodes() async {
        isLoading = true
        errorMessage = nil
        do {
            episodes = try await episodeService.fetchEpisodes().results
        } catch {
            errorMessage = ErrorHandler.shared.getErrorMessage(from: error)
        }
        isLoading = false
    }
    
}
