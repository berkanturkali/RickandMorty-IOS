//

import Foundation

struct CharacterService {
    
    static let shared = CharacterService()
    
    private init() {}
    
    
    func fetchCharacters(query: String? = nil) async throws -> BaseApiResponse<CharacterResponse> {
        
        let urlString = if(query != nil && !query!.isEmpty) {
            Constants.charactersEndpoint + "?" + query!.dropFirst()
        } else {
            Constants.charactersEndpoint
        }
        
        let characters: BaseApiResponse<CharacterResponse> = try await ApiManager.fetchData(from: urlString, responseType: BaseApiResponse<CharacterResponse>.self)
        return characters
    }
    
}
