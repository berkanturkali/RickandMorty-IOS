//

import SwiftUI
import SwiftData

@main
struct RickAndMortyApp: App {
    
    let container: ModelContainer
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        
        WindowGroup {
            GeometryReader { proxy in
                ContentView()
                    .environment(\.mainWindowSize, proxy.size)
                    .environment(\.isLargeScreen, proxy.size.width > 400)
                    .modelContainer(container)
                    .environmentObject(appState)
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

extension UINavigationController: UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
