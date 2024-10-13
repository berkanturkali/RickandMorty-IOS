//

import Foundation

class FiltersScreenViewModel: ObservableObject {
    
    @Published var isCheckMarkActive: Bool = false
    
    func setIsCheckMarkActive(selectedFilter: FilterItem?, previouslySelectedFilter: FilterItem?) {
        
        isCheckMarkActive = selectedFilter?.name != previouslySelectedFilter?.name
        
    }
}
