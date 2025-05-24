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
                if(viewModel.isInitialLoad) {
                    LoadingView()
                }
                else if (viewModel.errorMessage != nil) {
                    ErrorView(errorMessage: viewModel.errorMessage!)
                }
                else {
                    VStack(spacing: 16) {
                            HStack(spacing: 20) {
                                
                                NavigationLink(destination: {
                                    ApiTypesScreen(previousSelectedItem: viewModel.selectedApiType) { type in
                                        viewModel.selectedApiType = type ?? .rest
                                    }
                                }) {
                                    
                                    Image(systemName: "network")
                                        .font(isLargeScreen ? .largeTitle : .title2)
                                        .padding(.vertical, 4)
                                        .foregroundColor(.tabViewSelectedItem)
                                    
                                }
                                
                                NavigationLink(destination: {
                                    FilterMenuScreen(filterMenu: viewModel.filterMenu) { menu in
                                        var query = ""
                                        menu.forEach { menuItem in
                                            if(menuItem.selectedValue != nil) {
                                                query +=  "&" + menuItem.queryKey + "=" + menuItem.selectedValue!.value
                                            }
                                        }
                                        
                                        viewModel.setQuery(query: query)
                                        viewModel.filterMenu = menu
                                        
                                    }
                                }) {
                                    Image(systemName: "line.3.horizontal.decrease.circle")
                                        .font(isLargeScreen ? .largeTitle : .title2)
                                        .padding(.vertical, 4)
                                        .foregroundColor(.tabViewSelectedItem)
                                        .overlay {
                                            let isFilterApplied = viewModel.filterMenu.contains { !($0.selectedValue == nil) }
                                            if(isFilterApplied) {
                                                Circle()
                                                    .frame(width: 10, height: 10)
                                                    .foregroundColor(Color.onBackground)
                                                    .offset(x: 10, y: -10)
                                                
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
                        
                        
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
                        .onAppear {
                            if(character == viewModel.characters.last) {
                                Task {
                                    await viewModel.fetchCharacters(filterQuery: viewModel.query)
                                }
                            }
                        }
                }
            }
            if(viewModel.isLoading) {
                LoadingView()
                    .padding()
            }
        }
        .onChange(of: viewModel.characters.count) { _, _ in
            if let lastIndex = viewModel.characters.indices.last {
                proxy.scrollTo(lastIndex, anchor: .bottom)
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
