//
//  FilterItem.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 31.08.2024.
//

import Foundation


struct FilterItem: Hashable {
    let name: String
    let value: String
    var icon: String? = nil
    
    
    static var mockFilterItem: FilterItem {
        FilterItem(name: StatusFilter.alive.localizedDescription, value: "\(StatusFilter.alive)", icon: "⚦")
    }
}
