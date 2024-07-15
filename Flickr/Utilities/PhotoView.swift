//
//  WebImage.swift
//  Flickr
//
//  Created by Keith Dougherty on 7/14/24.
//

import SwiftUI


public struct PhotoView: View {
    let url: URL?
    
    public var body: some View {
        AsyncImage(url: url) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .clipShape(.rect(cornerRadius: 15))
    }
}
