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
        UITabBar.appearance().barTintColor = UIColor(Color.background)
    }
    var body: some View {
        TabView {
            NavigationView {                
                CharactersScreen()                
            }
            .tabItem { Label(
                LocalizedStrings.characters,
                systemImage: "house"
            )
            }
            
            NavigationView {
                ZStack {
                    Color.background.ignoresSafeArea()
                    LocationsScreen()
                }
                
            }
            .tabItem { Label(
                LocalizedStrings.locations,
                systemImage: "mappin.and.ellipse"
            ) }
            
            NavigationView {
                EpisodesScreen()
                
            }
            .tabItem { Label(
                LocalizedStrings.episodes,
                systemImage: "movieclapper"
            ) }
            
            NavigationView {
                ZStack {
                    Color.background.ignoresSafeArea()
                    Text(
                        LocalizedStrings.favorites
                    )
                }
            }
            .tabItem { Label(
                LocalizedStrings.favorites,
                systemImage: "star"
            ) }
        }
        .accentColor(Color.tabViewSelectedItem)
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

#Preview {
    ContentView()
}
