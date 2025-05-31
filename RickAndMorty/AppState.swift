//

import Foundation

class AppState: ObservableObject {
    
    @Published var selectedApiType: ApiType = .rest
    
}
