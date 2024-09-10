//
//  TabStateHandler.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 10.09.2024.
//

import Foundation
import SwiftUI

class TabStateHandler: ObservableObject {
    @Published var selectedTab: Tab = .characters
    
    @Published var scrollTabToTop: Bool = false
    
    
    var handler: Binding<Tab> { Binding(
        get: { self.selectedTab },
        set: { newValue in
            if(newValue == self.selectedTab) {
                self.scrollTabToTop = true
            } else {
                self.scrollTabToTop = false
                self.selectedTab = newValue
            }
        }
    )}
    
}
