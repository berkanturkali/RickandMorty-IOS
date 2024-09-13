//

import Foundation

enum NetworkError: Error {
    case invalidURL(String)
    case requestFailed(String)
    case decodingError(String)
}
