//

import Foundation

struct LocationService {
    static let shared = LocationService()
    
    private init() {}
    
    func fetchLocations() async throws -> BaseApiResponse<LocationResponse> {
        let urlString = Constants.locationsEndpoint
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL(urlString)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let locations = try JSONDecoder().decode(BaseApiResponse<LocationResponse>.self, from: data)
            return locations
        } catch {
            throw NetworkError.requestFailed(error.localizedDescription)
        }
    }
}
