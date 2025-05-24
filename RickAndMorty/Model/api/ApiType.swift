//

enum ApiType: CaseIterable {
    case rest
    case graphql
    
    var displayName: String {
        switch self {
        case .rest: return LocalizedStrings.rest
        case .graphql: return LocalizedStrings.graphql
        }
    }
}
