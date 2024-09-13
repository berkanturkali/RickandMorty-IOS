//

import Foundation

struct FilterMenu {
    let title: String
    var selectedValues: [FilterItem] = []
    var filters: [FilterItem]
    let queryKey: String
}
