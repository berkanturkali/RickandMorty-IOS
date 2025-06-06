//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    
    @StateObject var tabStateHandler: TabStateHandler = TabStateHandler()
    
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.tabViewUnSelectedItem)
        UITabBar.appearance().barTintColor = UIColor(Color.background)
        UITabBar.appearance().backgroundColor = UIColor(Color.background)
    }
    var body: some View {
        
        return TabView(selection: tabStateHandler.handler) {
            NavigationView {
                CharactersScreen(scrollToTop: $tabStateHandler.scrollTabToTop, appState: appState)
                
            }
            .tabItem { Label(
                LocalizedStrings.characters,
                systemImage: "house"
            )
            }
            .tag(Tab.characters)
                    
            NavigationView {
                ZStack {
                    Color.background.ignoresSafeArea()
                    LocationsScreen(scrollToTop: $tabStateHandler.scrollTabToTop,
                                    appState: appState)
                }
            }
            .tabItem { Label(
                LocalizedStrings.locations,
                systemImage: "mappin.and.ellipse"
            ) }
            .tag(Tab.locations)
            
            NavigationView {
                EpisodesScreen(scrollToTop: $tabStateHandler.scrollTabToTop, appState: appState)

            }
            .tabItem { Label(
                LocalizedStrings.episodes,
                systemImage: "movieclapper"
            ) }
            .tag(Tab.episodes)
            
            NavigationView {
                FavoritesScreen()
            }
            .tabItem { Label(
                LocalizedStrings.favorites,
                systemImage: "star"
            ) }
            .tag(Tab.favorites)
        }
        .accentColor(Color.tabViewSelectedItem)
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

#Preview {
    ContentView()
        .modelContainer(Preview().container)
        .environmentObject(AppState())
}
