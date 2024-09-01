//
//  LocationsScreen.swift
//  RickAndMorty
//
//  Created by Berkan Turkali on 1.09.2024.
//

import SwiftUI

struct LocationsScreen: View {
    
    @StateObject var viewModel = LocationsScreenViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.locations, id:\.self) { location in
                    
                }
            }
        }
    }
}

#Preview {
    LocationsScreen()
}
