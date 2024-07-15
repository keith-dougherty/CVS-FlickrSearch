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
    
    @MainActor
    public var description: AttributedString {
        let htmlText = photoDetails.description
        if let nsAttributedString = try? NSAttributedString(data: Data(htmlText.utf8), options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil),
           let attributedString = try? AttributedString(nsAttributedString, including: \.uiKit) {
            return attributedString
        } else {
            return AttributedString(htmlText)
        }
    }
    
    public var imageURL: URL? {
        photoDetails.mediaURL
    }
    
    public var publishedDate: String {
        photoDetails.published.toString()
    }
}

