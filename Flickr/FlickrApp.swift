//
//  FlickrApp.swift
//  Flickr
//
//  Created by Keith Dougherty on 7/13/24.
//

import SwiftUI

@main
struct FlickrApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SearchView()
            }
        }
    }
}
