//

import SwiftUI
import SwiftData

@main
struct RickAndMortyApp: App {
    
    let container: ModelContainer
    
    var body: some Scene {
        
        WindowGroup {
            GeometryReader { proxy in
                ContentView()
                    .environment(\.mainWindowSize, proxy.size)
                    .environment(\.isLargeScreen, proxy.size.width > 400)
                    .modelContainer(container)
            }
        }
    }
    
    init() {
        let schema = Schema([CharacterEntity.self, OriginEntity.self, LocationEntity.self])
        let config = ModelConfiguration("Favorites", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container.")
        }
    }
}
