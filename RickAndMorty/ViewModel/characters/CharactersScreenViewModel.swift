//
import Foundation

@MainActor
class CharactersScreenViewModel: ObservableObject {
    
    @Published var characters: [CharacterResponse] = []
    
    @Published var isLoading = false
    
    @Published var errorMessage: String? = nil
    
    @Published var filterMenu: [FilterMenu] = CharacterFilters.filters
    
    @Published var page = 1
    
    @Published var isInitialLoad = true
    
    var query: String? = nil
    
    private let charactersService = CharacterService.shared
    
    
    init() {
        Task {
            await fetchCharacters()
        }
    }
    
    func fetchCharacters(filterQuery: String? = nil) async {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        
        do {
            let query = if let filterQuery {
                filterQuery + "&page=\(page)"
            } else {
                "?page=\(page)"
            }
            
            let response = try await charactersService.fetchCharacters(query: query).results
            
            self.characters.append(contentsOf: response)
            self.page += 1
            self.isInitialLoad = false
            
        } catch {
            errorMessage = ErrorHandler.shared.getErrorMessage(from: error)
        }
        
        isLoading = false
    }
    
    func setQuery(query: String?) {
        resetViewModel()
        self.query = query        
        Task {
            await fetchCharacters(filterQuery: query)
        }
    }
    
    private func resetViewModel() {
        self.page = 1
        self.isInitialLoad = true
        self.characters = []
    }
    
}
