//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 27.08.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.tabViewUnSelectedItem)
    }
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    Color.background.ignoresSafeArea()
                    Text("Home Screen")
                }
            }
            .tabItem { Label(
                LocalizedStrings.home,
                systemImage: "house"
            )
        }
            
            NavigationView {
                ZStack {
                    Color.background.ignoresSafeArea()
                    Text("Search")
                }
            }
            .tabItem { Label(
                LocalizedStrings.search,
                systemImage: "magnifyingglass"
            ) }
            
            NavigationView {
                ZStack {
                    Color.background.ignoresSafeArea()
                    Text("Favorites")
                }
            }
            .tabItem { Label(
                LocalizedStrings.favorites,
                systemImage: "star"
            ) }
        }
        .accentColor(Color.tabViewSelectedItem)
    
    }
}

#Preview {
    ContentView()
}
