//
//  CharacterDetailsScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 5.09.2024.
//

import SwiftUI
import SwiftData

struct CharacterDetailsScreen: View {
    
    @Environment(\.isLargeScreen) private var isLargeScreen: Bool
    @Environment(\.mainWindowSize) private var mainWindowSize: CGSize
    @Environment(\.modelContext) var modelContext: ModelContext
    
    @StateObject private var viewModel: CharacterDetailsScreenViewModel = CharacterDetailsScreenViewModel()
    
    let character: CharacterResponse
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack(spacing: 16) {
                    
                    HStack {
                        
                        BackButton()
                        
                        Image(systemName: viewModel.favorited ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                            .font(isLargeScreen ? .largeTitle : .title3)
                            .scaleEffect(scale)
                            .onTapGesture {
                                viewModel.favorited.toggle()
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    scale = 1.2
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(.easeIn(duration: 0.2)) {
                                        scale = 1.0
                                    }
                                }
                                if(viewModel.favorited) {
                                    viewModel.addToFavorites(context: modelContext, character: character)
                                } else {
                                    viewModel.removeFromFavorites(context: modelContext, character: character)
                                }
                            }
                    }
                    .padding(.horizontal, 20)
                    
                    
                    
                    ScrollView {
                        
                        if(isLargeScreen) {
                            CharacterDetailsContentForLargeDevices(width: mainWindowSize.width)
                        } else {
                            CharacterDetailsContentForSmallDevices()
                        }
                    }
                    .scrollIndicators(.hidden)
                    .task {
                        if(!character.episode.isEmpty) {
                            let episodeIds = character.episode.compactMap { urlString -> String? in
                                if let urlString {
                                    if let url = URL(string: urlString) {
                                        return url.lastPathComponent
                                    }
                                }
                                return nil
                            }
                            
                            for id in episodeIds {
                                await viewModel.fetchEpisode(episodeId: id)
                            }
                        }
                    }
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            let fetchRequest = FetchDescriptor<CharacterEntity>(
                predicate: #Predicate { $0.id == character.id!}
            )
            
            let matchingCharacters = try? modelContext.fetch(fetchRequest)
            
            viewModel.favorited = matchingCharacters?.count ?? 0 > 0
            
        }
    }
    
    fileprivate func CharacterDetailsContentForSmallDevices() -> some View {
        return VStack(spacing: 16) {
            CharacterImage(imageUrl: character.image)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .frame(height: 350)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .scaledToFill()
            
            
            VStack(spacing: 20) {
                
                if let name = character.name {
                    CharacterName(name: name, font: .title2, lineLimit: 3)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                }
                
                if let status = character.status {
                    
                    DetailsHorizontalSection(title: LocalizedStrings.statusFilterTitle) {
                        CharacterStatus(
                            status: status,
                            statusColor: character.statusColor,
                            alignment: .trailing
                        )
                    }
                }
                
                if let gender = character.characterGender {
                    DetailsHorizontalSection(title: LocalizedStrings.genderFilterTitle) {
                        CharacterGender(gender: gender)
                    }
                }
                
                if let location = character.location?.name {
                    DetailsHorizontalSection(title: String(LocalizedStrings.locationTitle.dropLast())) {
                        CharacterLocation(location: location)
                    }
                }
            }
            
            VStack {
                if(!viewModel.episodes.isEmpty) {
                    HStack {
                        Text(LocalizedStrings.episodes)
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                        Spacer()
                        if(character.episode.count > 20) {
                            NavigationLink(destination: {
                                AllEpisodesScreen(episodes: $viewModel.episodes)
                            }) {
                                Group {
                                    Text(LocalizedStrings.seeAll)
                                    
                                    +
                                    Text("(\(character.episode.count))")
                                    
                                }
                                .font(.caption)
                                .underline()
                                .padding(.horizontal)
                            }
                        }
                        
                    }
                    .foregroundColor(Color.onBackground)
                    
                    Divider()
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 20) {
                            ForEach(viewModel.episodes.prefix(20), id: \.self) { episode in
                                EpisodeGridItemView(episode: episode)
                                    .padding(.vertical, 8)
                                    .frame(width: 200)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.vertical, 8)
            
            
        }
    }
    
    
    fileprivate func CharacterDetailsContentForLargeDevices(width: CGFloat) -> some View {
        return VStack {
            HStack {
                CharacterImage(imageUrl: character.image)
                    .clipShape(Circle())
                    .frame(height: 400)
                    .padding(.horizontal)
                    .padding(.vertical, 50)
                
                VStack(spacing: 24) {
                    if let name = character.name {
                        CharacterName(name: name, font: .title, lineLimit: 3)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    }
                    
                    if let status = character.status {
                        
                        DetailsHorizontalSection(title: LocalizedStrings.statusFilterTitle, font: .title) {
                            CharacterStatus(
                                status: status,
                                statusColor: character.statusColor,
                                alignment: .trailing,
                                font: .title
                            )
                        }
                    }
                    
                    if let gender = character.characterGender {
                        DetailsHorizontalSection(title: LocalizedStrings.genderFilterTitle, font: .title) {
                            CharacterGender(gender: gender, font: .title)
                        }
                    }
                    
                    if let location = character.location?.name {
                        DetailsHorizontalSection(title: String(LocalizedStrings.locationTitle.dropLast()), font: .title) {
                            CharacterLocation(location: location, font: .title)
                        }
                    }
                }
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                .padding(.top, 64)
                .foregroundColor(Color.onBackground)
            }
            
            VStack {
                if(!viewModel.episodes.isEmpty) {
                    let columns = Array(
                        repeating: GridItem(
                            .flexible(),
                            spacing: 15
                        ),
                        count: min(
                            5,
                            Int(
                                width / 150
                            )
                        )
                    )
                    HStack {
                        Text(LocalizedStrings.episodes)
                            .font(.title)
                            .bold()
                            .padding(.horizontal)
                        Spacer()
                    }
                    .foregroundColor(Color.onBackground)
                    
                    Divider()
                    
                    ScrollView() {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.episodes, id: \.self) { episode in
                                EpisodeGridItemView(episode: episode)
                                    .frame(maxWidth: 250)
                                
                            }
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    }
                    .scrollIndicators(.hidden)
                    
                }
            }
            .padding(.vertical, 8)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
        }
    }
    
}

#Preview {
    let preview = Preview()
    return CharacterDetailsScreen(character: CharacterResponse.mockCharacter)
        .modelContainer(preview.container)
}
