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
        
        print("url = ", urlString)
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL(urlString)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let characters = try JSONDecoder().decode(BaseApiResponse<CharacterResponse>.self, from: data)
            return characters
        } catch {
            throw NetworkError.requestFailed(error.localizedDescription)
        }
    }
    
}
