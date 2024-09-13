//

import SwiftUI
import SwiftData

struct FavoritesScreen: View {
    
    @Environment(\.modelContext) private var modelContext: ModelContext
    
    @StateObject private var viewModel: FavoritesScreenViewModel = FavoritesScreenViewModel()
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            if(viewModel.favorites.isEmpty) {
                EmptyFavoritesView()
            } else {
                List {
                    ForEach(viewModel.favorites, id: \.self) { character in
                        CharacterView(character: character)
                            .listRowBackground(Color.background)
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewModel.removeFromFavorites(context: modelContext, character: viewModel.favorites[index])
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
                
            }
        }
        .onAppear {
            viewModel.fetchFavorites(context: modelContext)
        }
    }
}

#Preview {
    let preview = Preview()
    return FavoritesScreen()
        .modelContainer(preview.container)
}
