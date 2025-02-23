//
//  SearchView.swift
//  Flickr
//
//  Created by Keith Dougherty on 7/14/24.
//

import Dependencies
import SwiftUI
import SwiftUINavigation

public struct SearchView: View {
    @State var viewModel: SearchViewModel
    
    public var body: some View {
        VStack {
            if let results = viewModel.photos {
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 8), count: 2)) {
                        ForEach(results.items, id: \.self) { details in
                            PhotoView(url: details.mediaURL)
                                .onTapGesture {
                                    viewModel.showDetails(photo: details)
                                }
                        }
                    }
                }
            } else {
                ContentUnavailableView {
                    Text("Search Tags to view related photos")
                }
            }
        }
        .overlay {
            if viewModel.isSearching {
                ProgressView()
            }
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationTitle("Search Flickr Photos")
        .navigationDestination(item: $viewModel.destination.showDetails, destination: { $viewModel in
            PhotoDetailsView(viewModel: viewModel)
        })
        .onSubmit(of: .search) { Task { await viewModel.search() } }
        .onChange(of: viewModel.searchText) { 
            Task { await viewModel.search() }
        }
        .padding(.horizontal)
    }
}

#Preview(body: {
//    withDependencies {
//        $0.networkClient.searchPhotos = { Photos.Mock.photos }
//    } operation: {
        NavigationStack {
            SearchView(viewModel: .init())
        }
//    }
})


