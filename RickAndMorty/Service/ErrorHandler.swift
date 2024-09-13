//

import Foundation

class ErrorHandler {
    static let shared = ErrorHandler()
    
    private init() {}
    
    func getErrorMessage(from error: Error) -> String {
        if let networkError = error as? NetworkError {
            switch networkError {
            case .invalidURL(let url):
                return LocalizedStrings.invalidURLErrorMessage + "\(url)";
            case .requestFailed(let message):
                return message;
            case .decodingError(let message):
                return message;
            }
        } else {
            return LocalizedStrings.unknownNetworkErrorMessage
        }
    }
}
