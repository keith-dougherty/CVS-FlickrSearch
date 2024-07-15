//
//  PhotoDetailsViewModel.swift
//  Flickr
//
//  Created by Keith Dougherty on 7/14/24.
//

import SwiftUI

@Observable
final public class PhotoDetailsViewModel {
    private let photoDetails: PhotoDetails
    
    init(photoDetails: PhotoDetails) {
        self.photoDetails = photoDetails
    }
    
    public var title: String {
        photoDetails.title
    }
    
    public var author: String {
        photoDetails.author
    }
    
    public var description: String {
        photoDetails.description
    }
    
    public var imageURL: URL? {
        photoDetails.mediaURL
    }
    
    public var publishedDate: String {
        photoDetails.published.toString()
    }
}

