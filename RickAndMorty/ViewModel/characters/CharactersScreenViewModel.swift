//
import Foundation

@MainActor
class CharactersScreenViewModel: ObservableObject {
    
    @Published var characters: [CharacterResponse] = []
    
    @Published var isLoading = false
    
    @Published var errorMessage: String? = nil
    
    private let charactersService = CharacterService.shared
    
    @Published var filterMenu: [FilterMenu] = CharacterFilters.filters
    
    init() {
        Task {
            await fetchCharacters()
        }
    }
    
    func fetchCharacters(query: String? = nil) async {
        isLoading = true
        errorMessage = nil
        
        do {
            characters = try await charactersService.fetchCharacters(query: query).results
        } catch {
            errorMessage = ErrorHandler.shared.getErrorMessage(from: error)
        }
        
        isLoading = false
    }
    
}
