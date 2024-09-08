//
//  MainWindowSizeKey.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 7.09.2024.
//

import Foundation
import SwiftUI

private struct IsLargeScreen: EnvironmentKey {
    static let defaultValue: Bool = false
}

private struct MainWindowSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var mainWindowSize: CGSize {
        get { self[MainWindowSizeKey.self] }
        set { self[MainWindowSizeKey.self] = newValue }
    }
    
    var isLargeScreen: Bool {
        get{ self[IsLargeScreen.self] }
        set { self[IsLargeScreen.self] = newValue }
    }
}
