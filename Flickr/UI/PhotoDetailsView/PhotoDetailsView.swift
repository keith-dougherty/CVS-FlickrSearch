//
//  PhotoDetailsView.swift
//  Flickr
//
//  Created by Keith Dougherty on 7/14/24.
//

import SwiftUI

struct PhotoDetailsView: View {
    var viewModel: PhotoDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
           
            HStack {
                Spacer()
                Text(viewModel.title)
                    .font(.title.bold())
                Spacer()
            }
        
            PhotoView(url: viewModel.imageURL)
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "info.circle")
                    }
                    .padding()
                }

            LabeledContent("Uploaded By") {
                Text(viewModel.author)
            }
            .font(.footnote)
            
            LabeledContent("Uploaded On:") {
                Text(viewModel.publishedDate)
            }
            .font(.footnote)
              
            desciptionView
        }
        .padding()
    }
    
    @ViewBuilder
    var desciptionView: some View {
        let htmlText = viewModel.description
        if let nsAttributedString = try? NSAttributedString(data: Data(htmlText.utf8), options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil),
           let attributedString = try? AttributedString(nsAttributedString, including: \.uiKit) {
            Text(attributedString)
        } else {
            Text(htmlText)
        }
    }
}

#Preview {
    PhotoDetailsView(viewModel: .init(photoDetails: .Mock.item))
}
