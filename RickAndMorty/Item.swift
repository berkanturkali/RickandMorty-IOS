//
//  Item.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 27.08.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
