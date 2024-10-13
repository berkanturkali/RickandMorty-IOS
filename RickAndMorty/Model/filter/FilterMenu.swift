//

import Foundation

struct FilterMenu {
    let title: String
    var selectedValue: FilterItem? = nil
    var filters: [FilterItem]
    let queryKey: String
}
