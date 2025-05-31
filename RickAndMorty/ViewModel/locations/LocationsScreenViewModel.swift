//

import Foundation
import Combine
import Apollo
import RickAndMortyAPI

@MainActor
class LocationsScreenViewModel: ObservableObject {
    
    @Published var locations: [LocationResponse] = []
    
    @Published var isLoading = false
    
    @Published var errorMessage: String? = nil
    
    private let locationsService = LocationService.shared
    
    private let apollo = Network.shared.apollo
    
    private var cancellables = Set<AnyCancellable>()
    
    init(appState: AppState) {
        appState.$selectedApiType
            .removeDuplicates()
            .sink { type in
                Task {
                    await self.fetchLocations(apiType: type)
                }
            }
            .store(in: &cancellables)
        
    }
    
    func fetchLocations(apiType: ApiType) async {
        isLoading = true
        errorMessage = nil
        do {
            if(apiType == .rest) {
                locations = try await locationsService.fetchLocations().results
            } else {
                apollo.fetch(query: LocationsQuery(page: 1)) { result in
                    switch result {
                    case .success(let graphQLResponse):
                        guard let results = graphQLResponse.data?.locations?.results else {
                            return
                        }
                        var mappedLocations: [LocationResponse] = []
                        for result in results {
                            guard let result = result else { continue }
                            let location = LocationResponse(
                                id: Int(
                                    result.id ?? "0"
                                ),
                                name: result.name,
                                type: result.type,
                                dimension: nil,
                                residents: [],
                                url: nil,
                                created: nil
                            )
                            mappedLocations.append(location)
                        }
                        self.locations = mappedLocations
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
