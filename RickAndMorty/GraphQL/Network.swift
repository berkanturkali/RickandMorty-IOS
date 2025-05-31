//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    let apollo: ApolloClient
    
    private init() {
        apollo = ApolloClient(url: URL(string: Constants.graphqlBaseURL)!)
    }
}
