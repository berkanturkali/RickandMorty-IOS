//

import SwiftUI

struct LocationsScreen: View {
    
    @StateObject var viewModel: LocationsScreenViewModel
    
    @Binding var scrollToTop: Bool
    
    init(scrollToTop: Binding<Bool>, appState: AppState) {
        _scrollToTop = scrollToTop
        _viewModel = StateObject(wrappedValue: LocationsScreenViewModel(appState: appState))
    }
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            if(viewModel.isLoading) {
                LoadingView()
            } else if(viewModel.errorMessage != nil) {
                ErrorView(errorMessage: viewModel.errorMessage!)
            } else {
                
            }
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.locations, id:\.id) { location in
                            LocationView(location: location)
                                .id(location.id)
                        }
                    }
                    .onChange(of: scrollToTop) { _, scroll in
                        if(scroll) {
                            withAnimation {
                                proxy.scrollTo(
                                    viewModel.locations.first?.id,
                                    anchor: .top
                                )
                            }
                            scrollToTop = false
                        }
                        
                    }
                    
                }
            }
            .scrollIndicators(.hidden)
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    LocationsScreen(scrollToTop: .constant(false), appState: AppState())
}
