//

import Foundation

struct LocationService {
    static let shared = LocationService()
    
    private init() {}
    
    func fetchLocations() async throws -> BaseApiResponse<LocationResponse> {
        let urlString = Constants.locationsEndpoint
        let locations: BaseApiResponse<LocationResponse> = try await ApiManager.fetchData(from: urlString, responseType: BaseApiResponse<LocationResponse>.self)
        return locations
    }
}
