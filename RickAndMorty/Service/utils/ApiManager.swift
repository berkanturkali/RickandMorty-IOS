//

import Foundation


struct ApiManager {
    static func fetchData<T: Decodable>(from urlString: String, responseType: T.Type) async throws -> T {
        
        if(!isValidUrl(urlString)) {
            throw NetworkError.invalidURL(urlString)
        }
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL(urlString)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
        
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                throw NetworkError.requestFailed("Request failed with status code: \(statusCode)")
            }
    
            
            let decodedResponse = try JSONDecoder().decode(responseType, from: data)
            return decodedResponse
        } catch let error as URLError {
            throw NetworkError.requestFailed("Network error: \(error.localizedDescription)")
        } catch is DecodingError {
            throw NetworkError.decodingError(LocalizedStrings.failedToDecodeErrorMessage)
        } catch {
            throw NetworkError.requestFailed(error.localizedDescription)
        }
    }
    
    private static func isValidUrl(_ url: String) -> Bool {
        if let url = URL(string: url),
           let scheme = url.scheme, (scheme == "http" || scheme == "https"),
           isValidDomain(host: url.host) {
            return true
        }
        return false
    }
    
    private static func isValidDomain(host: String?) -> Bool {
        guard let host else { return false }
        let domainRegex = #"^([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$"#
        if let _ = host.range(of: domainRegex, options: .regularExpression) {
            return true
        }
        return false
    }
}
