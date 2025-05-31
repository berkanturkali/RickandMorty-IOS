//

import Foundation
import Apollo
import RickAndMortyAPI
import Combine

@MainActor
class EpisodesScreenViewModel: ObservableObject {
    
    @Published var episodes: [EpisodeResponse] = []
    
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String? = nil
    
    private let episodeService = EpisodeService.shared
    
    private let apollo = Network.shared.apollo
    
    private var cancellables = Set<AnyCancellable>()
    
    init(appState: AppState) {
        appState.$selectedApiType
            .removeDuplicates()
            .sink { type in
                Task {
                    await self.fetchEpisodes(apiType: type)
                }
            }
            .store(in: &cancellables)
    }
    
    
    func fetchEpisodes(apiType: ApiType) async {
        isLoading = true
        errorMessage = nil
        do {
            if(apiType == .rest) {
                episodes = try await episodeService.fetchEpisodes().results
            } else {
                apollo.fetch(query: EpisodesQuery(page: 1)) { result in
                    
                    switch result {
                    case .success(let graphQLResponse):
                        guard let results = graphQLResponse.data?.episodes?.results else { return }
                        var mappedEpisodes: [EpisodeResponse] = []
                        for result in results {
                            guard let result = result else { continue }
                            
                            let episode = EpisodeResponse(
                                id: Int(result.id ?? "0"),
                                name: result.name ?? "",
                                airDate: result.air_date ?? "",
                                episode: nil,
                                characters: [],
                                url: nil,
                                created: nil
                            )
                            
                            mappedEpisodes.append(episode)
                            
                        }
                        self.episodes = mappedEpisodes
                    case .failure(let error):
                        self.errorMessage = ErrorHandler.shared.getErrorMessage(from: error)
                    }
                }
            }
        } catch {
            errorMessage = ErrorHandler.shared.getErrorMessage(from: error)
        }
        isLoading = false
    }
    
}
