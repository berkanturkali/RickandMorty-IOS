//
//  CharactersScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 30.08.2024.
//

import SwiftUI

struct CharactersScreen: View {
    
    @StateObject var viewModel = CharactersScreenViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let isLargeScreen = geometry.size.width > 400
                ZStack {
                    Color.background.ignoresSafeArea()
                    ScrollView {
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
                                    .font(isLargeScreen ? .system(size: 42) : .title)
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                    .foregroundColor(.tabViewSelectedItem)
                                    .overlay {
                                        let hasNonEmptySelectedValues = viewModel.filterMenu.contains { !$0.selectedValues.isEmpty }
                                        if(hasNonEmptySelectedValues) {
                                            Circle()
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(Color.onBackground)
                                                .offset(x: 14, y: -15)
                                            
                                            
                                        }
                                    }
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                                
                            }
                            
                            
                            Divider()
                                .padding(.horizontal)
                            
                            
                            if(isLargeScreen) {
                                let columns = Array(
                                    repeating: GridItem(
                                        .flexible(),
                                        spacing: 20
                                    ),
                                    count: min(
                                        5,
                                        Int(
                                            geometry.size.width / 150
                                        )
                                    )
                                )
                                characterGridView(columns: columns)
                                
                            } else {
                                characterVerticalListView()
                            }
                        }
                    }
                    .padding(.horizontal, 4)
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
    
    func characterGridView(columns: [GridItem]) -> some View {
        LazyVGrid(columns: columns, spacing: 24) {
            ForEach(viewModel.characters, id: \.self) { character in
                CharacterGridViewItem(character: character)
            }
        }
    }
    
    func characterVerticalListView() -> some View {
        LazyVStack(spacing: 16) {
            ForEach(viewModel.characters, id:\.self) { character in
                CharacterView(character: character)
            }
        }
    }
}

#Preview {
    NavigationStack {
        CharactersScreen()
    }
}
