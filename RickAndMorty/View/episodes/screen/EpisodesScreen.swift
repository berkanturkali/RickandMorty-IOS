//

import SwiftUI

struct EpisodesScreen: View {
    
    @Environment(\.isLargeScreen) private var isLargeScreen: Bool
    @Environment(\.mainWindowSize) private var mainWindowSize: CGSize
    
    @StateObject var viewModel = EpisodesScreenViewModel()
    
    @Binding var scrollToTop: Bool
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            if(viewModel.isLoading) {
                LoadingView()
            } else {
                ScrollViewReader { proxy in
                    ScrollView {
                        if(isLargeScreen) {
                            let columns = Array(
                                repeating: GridItem(
                                    .flexible(),
                                    spacing: 10
                                ),
                                count: min(
                                    4,
                                    Int(
                                        mainWindowSize.width / 150
                                    )
                                )
                            )
                            episodesGridView(columns: columns, proxy: proxy)
                            
                        } else {
                            episodesListView(proxy: proxy)
                        }
                    }
                }
            }
        }
    }
    
    func episodesGridView(columns: [GridItem], proxy: ScrollViewProxy) -> some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel.episodes, id: \.id) { episode in
                EpisodeGridItemView(episode: episode)
                    .id(episode.id)
            }
        }
        .onChange(of: scrollToTop) { _, scroll in
            if(scroll) {
                withAnimation {
                    proxy.scrollTo(
                        viewModel.episodes.first?.id,
                        anchor: .top
                    )
                }
                scrollToTop = false
            }
        }
    }
    
    func episodesListView(proxy: ScrollViewProxy) -> some View {
        VStack(spacing: 16) {
            ForEach(viewModel.episodes, id:\.id) { episode in
                EpisodeView(episode: episode)
                    .id(episode.id)
            }
        }
        .onChange(of: scrollToTop) { _, scroll in
            if(scroll) {
                withAnimation {
                    proxy.scrollTo(
                        viewModel.episodes.first?.id,
                        anchor: .top
                    )
                }
                scrollToTop = false
            }
        }
    }
}

#Preview {
    EpisodesScreen(scrollToTop: .constant(false))
}
