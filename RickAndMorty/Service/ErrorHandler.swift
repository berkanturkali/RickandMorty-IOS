//

import Foundation

class ErrorHandler {
    static let shared = ErrorHandler()
    
    private init() {}
    
    func getErrorMessage(from error: Error) -> String {
        if let networkError = error as? NetworkError {
            switch networkError {
            case .invalidURL(let url):
                print("in invalid url")
                return LocalizedStrings.invalidURLErrorMessage + "\(url)";
            case .requestFailed(let message):
                print("in request failed")
                return message;
            case .decodingError(let message):
                print("in decoding error")
                return message;
            }
        } else {
            print("in else")
            return LocalizedStrings.unknownNetworkErrorMessage
        }
    }
}
