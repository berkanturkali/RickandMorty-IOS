//

import Foundation

enum Status: String {
    case dead = "dead"
    case alive = "alive"
    
    init?(from string: String) {
        switch string.lowercased() {
        case "dead":
            self = .dead
        case "alive":
            self = .alive
        default: return nil
        }
    }
}
