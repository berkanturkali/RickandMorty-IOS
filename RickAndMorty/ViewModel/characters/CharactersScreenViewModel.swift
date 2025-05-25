//
import Foundation
import Combine
import RickAndMortyAPI

@MainActor
class CharactersScreenViewModel: ObservableObject {
    
    @Published var characters: [CharacterResponse] = []
    
    @Published var isLoading = false
    
    @Published var errorMessage: String? = nil
    
    @Published var filterMenu: [FilterMenu] = CharacterFilters.filters
    
    @Published var page = 1
    
    @Published var isInitialLoad = true
    
    @Published var selectedApiType = ApiType.rest
    
    var query: String? = nil
    
    private let charactersService = CharacterService.shared
    
    private let apollo = Network.shared.apollo
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $selectedApiType
            .sink { newType in
                self.page = 1
                self.characters.removeAll()
                Task {
                    await self.fetchCharacters(apiType: newType)
                }
            }
            .store(in: &cancellables)
        
    }
    
    func fetchCharacters(apiType: ApiType, filterQuery: String? = nil) async {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        
        do {
            let query = if let filterQuery {
                filterQuery + "&page=\(page)"
            } else {
                "?page=\(page)"
            }
            switch apiType {
            case .rest:
                let response = try await charactersService.fetchCharacters(query: query).results
                
                self.characters.append(contentsOf: response)
                break
            case .graphql:
                apollo.fetch(query: CharactersQuery(page: page)) { result in
                    switch result {
                    case .success(let graphQLResponse):
                        guard let results = graphQLResponse.data?.characters?.results else {
                            return
                        }
                        
                        var mappedCharacters: [CharacterResponse] = []
                        
                        for result in results {
                            guard let result = result else { continue }
                            
                            let character = CharacterResponse(
                                id: Int(result.id ?? "0"),
                                name: result.name ?? "",
                                status: result.status,
                                species: result.species ?? "",
                                origin: CharacterResponse.Origin(
                                    name: result.origin?.name ?? "",
                                    url: nil
                                ),
                                location: CharacterResponse.Location(
                                    name: result.location?.name ?? "",
                                    url: nil
                                ),
                                image: result.image ?? "",
                                episode: []
                            )
                            
                            mappedCharacters.append(character)
                        }
                        
                        self.characters.append(contentsOf: mappedCharacters)
                        break
                    case .failure(let error):
                        print("Error fetching data: \(error)")
                        break
                    }
                }
            }
            
            self.page += 1
            self.isInitialLoad = false
            
        } catch {
            errorMessage = ErrorHandler.shared.getErrorMessage(from: error)
        }
        isLoading = false
        isInitialLoad = false
        
    }
    
    func setQuery(query: String?) {
        resetViewModel()
        self.query = query
        Task {
            await fetchCharacters(apiType: selectedApiType, filterQuery: query)
        }
    }
    
    private func resetViewModel() {
        self.page = 1
        self.isInitialLoad = true
        self.characters = []
    }
    
}
