//

import Foundation

struct BaseApiResponse<T: Codable>: Codable {
    
    let info: Info
    let results: [T]
    
    struct Info: Codable {
        let count: Int?
        let pages: Int?
        let next: String?
        let prev: String?
    }
}
