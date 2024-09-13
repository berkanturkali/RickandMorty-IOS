//
//  LocationsScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 1.09.2024.
//

import SwiftUI

struct LocationsScreen: View {
    
    @StateObject var viewModel = LocationsScreenViewModel()
    
    @Binding var scrollToTop: Bool
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                ZStack {
                    Color.background.ignoresSafeArea()
                    if(viewModel.isLoading) {
                        LoadingView()
                    } else {
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
            }
            .scrollIndicators(.hidden)
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    LocationsScreen(scrollToTop: .constant(false))
}
