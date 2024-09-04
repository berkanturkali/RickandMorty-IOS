//
//  FiltersScreenViewModel.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 3.09.2024.
//

import Foundation

class FiltersScreenViewModel: ObservableObject {
    
    @Published var isCheckMarkActive: Bool = false
    
    func setIsCheckMarkActive(selectedFilters: [FilterItem], previouslySelectedFilters: [FilterItem]) {
        
        let selectedFilterNames = Set(selectedFilters.map { $0.name })
        let previousFilterNames = Set(previouslySelectedFilters.map { $0.name })
        
        isCheckMarkActive = selectedFilterNames != previousFilterNames
        
    }
}
