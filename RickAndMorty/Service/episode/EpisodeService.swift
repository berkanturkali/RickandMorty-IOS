//

import Foundation

struct EpisodeService {
    
    static let shared = EpisodeService()
    
    private init() {}
    
    
    func fetchEpisodes() async throws -> BaseApiResponse<EpisodeResponse> {
        let urlString = Constants.episodesEndpoint
        let episodes: BaseApiResponse<EpisodeResponse> = try await ApiManager.fetchData(from: urlString, responseType: BaseApiResponse<EpisodeResponse>.self)
        return episodes
    }
    
    func fetchEpisode(id: String) async throws -> EpisodeResponse {
        let urlString = Constants.episodesEndpoint + "/\(id)"
        let episode: EpisodeResponse = try await ApiManager.fetchData(from: urlString, responseType: EpisodeResponse.self)
        return episode
    }
    
}
