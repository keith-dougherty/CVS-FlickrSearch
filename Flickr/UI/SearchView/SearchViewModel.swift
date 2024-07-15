//
//  SearchViewModel.swift
//  Flickr
//
//  Created by Keith Dougherty on 7/14/24.
//

import Dependencies
import SwiftUI
import SwiftUINavigation

@Observable
final public class SearchViewModel {
    public var destination: Destination? {
        didSet { self.bindDestination() }
    }
    
    @CasePathable
    public enum Destination {
        case showDetails(PhotoDetailsViewModel)
    }
    
    public var photos: Photos?
    public var searchText: String = ""
    public var isSearching: Bool = false
    
    init(destination: Destination? = nil) {
        self.destination = destination
    }
    
    public func search() async {
        @Dependency(\.networkClient) var networkClient
        
        defer { isSearching = false }
        
        guard !searchText.isEmpty else {
            self.photos = nil
            return
        }
        
        do {
            isSearching = true
            self.photos = try await networkClient.searchPhotos(searchText)
        } catch {
            print(error)
        }
    }
    
    public func showDetails(photo: PhotoDetails) {
        self.destination = .showDetails(.init(photoDetails: photo))
    }
}

private extension SearchViewModel {
    func bindDestination() {
        switch destination {
        case .showDetails:
            print("show detail tapped")
        case .none:
            break
        }
    }
}
