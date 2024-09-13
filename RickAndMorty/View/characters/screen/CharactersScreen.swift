//

import SwiftUI

struct CharactersScreen: View {
    
    @StateObject var viewModel = CharactersScreenViewModel()
    @Environment(\.isLargeScreen) private var isLargeScreen: Bool
    @Environment(\.mainWindowSize) private var mainWindowSize: CGSize
    
    @Binding var scrollToTop: Bool
    
    var body: some View {
        return NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                if(viewModel.isLoading) {
                    LoadingView()
                } else {
                    VStack(spacing: 16) {
                        NavigationLink(destination: {
                            FilterMenuScreen(filterMenu: viewModel.filterMenu) { menu in
                                var query = ""
                                menu.forEach { menuItem in
                                    menuItem.selectedValues.forEach { filterItem in
                                        query +=  "&" + menuItem.queryKey + "=" + filterItem.name
                                    }
                                }
                                Task {
                                    await viewModel.fetchCharacters(query: query)
                                }
                                viewModel.filterMenu = menu
                                
                            }
                        }) {
                            
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .font(isLargeScreen ? .largeTitle : .title2)
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                                .foregroundColor(.tabViewSelectedItem)
                                .overlay {
                                    let hasNonEmptySelectedValues = viewModel.filterMenu.contains { !$0.selectedValues.isEmpty }
                                    if(hasNonEmptySelectedValues) {
                                        Circle()
                                            .frame(width: 10, height: 10)
                                            .foregroundColor(Color.onBackground)
                                            .offset(x: 10, y: -10)
                                        
                                        
                                    }
                                }
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                            
                        }
                        
                        
                        Divider()
                            .padding(.horizontal)
                        
                        ScrollViewReader { proxy in
                            ScrollView {
                                if(isLargeScreen) {
                                    let columns = Array(
                                        repeating: GridItem(
                                            .flexible(),
                                            spacing: 20
                                        ),
                                        count: min(
                                            5,
                                            Int(
                                                mainWindowSize.width / 150
                                            )
                                        )
                                    )
                                    characterGridView(columns: columns, proxy: proxy)
                                    
                                } else {
                                    characterVerticalListView(proxy: proxy)
                                }
                                
                            }
                        }
                        
                    }
                    .padding(.horizontal, 4)
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
    
    func characterGridView(columns: [GridItem], proxy: ScrollViewProxy) -> some View {
        LazyVGrid(columns: columns, spacing: 24) {
            ForEach(viewModel.characters, id: \.self) { character in
                NavigationLink(destination: {
                    CharacterDetailsScreen(character: character)
                }) {
                    CharacterGridViewItem(character: character)
                }
            }
        }
        .onChange(of: scrollToTop) { _, scroll in
            if(scroll) {
                withAnimation {
                    proxy.scrollTo(
                        viewModel.characters.first
                    )
                }
                scrollToTop = false
            }
            
        }
    }
    
    func characterVerticalListView(proxy: ScrollViewProxy) -> some View {
        LazyVStack(spacing: 16) {
            ForEach(viewModel.characters, id:\.id) { character in
                NavigationLink(destination: {
                    CharacterDetailsScreen(character: character)
                }) {
                    CharacterView(character: character)
                        .id(character.id)
                }
            }
        }
        .onChange(of: scrollToTop) { _, scroll in
            if(scroll) {
                withAnimation {
                    proxy.scrollTo(
                        viewModel.characters.first?.id,
                        anchor: .top
                    )
                }
                scrollToTop = false
            }
        }
    }
}

#Preview {
    NavigationStack {
        CharactersScreen(scrollToTop: .constant(true))
            .environment(\.mainWindowSize, CGSize(width: 300.0, height: 0.0))
            .environment(\.isLargeScreen, false)
    }
}
