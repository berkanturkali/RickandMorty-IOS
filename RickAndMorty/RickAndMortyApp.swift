//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 27.08.2024.
//

import SwiftUI
import SwiftData

@main
struct RickAndMortyApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            GeometryReader { proxy in
                ContentView()
                    .environment(\.mainWindowSize, proxy.size)
                    .environment(\.isLargeScreen, proxy.size.width > 400)
            }
        }
    }
}
