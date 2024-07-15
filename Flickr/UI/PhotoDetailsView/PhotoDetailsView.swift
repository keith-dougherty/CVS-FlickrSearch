//
//  PhotoDetailsView.swift
//  Flickr
//
//  Created by Keith Dougherty on 7/14/24.
//

import SwiftUI

struct PhotoDetailsView: View {
    let viewModel: PhotoDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
               
                header
            
                PhotoView(url: viewModel.imageURL)
                    .overlay(alignment: .bottomTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "info.circle")
                        }
                        .padding()
                    }
    
                Group {
                    Text("Uploaded by: \(viewModel.author)")
                    Text("on: \(viewModel.publishedDate)")
                }
                .multilineTextAlignment(.leading)
                .font(.footnote)
                
                Text(viewModel.description)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
    
    var header: some View {
        HStack {
            Spacer()
            Text(viewModel.title)
                .font(.title.bold())
            Spacer()
        }
    }
}

#Preview {
    PhotoDetailsView(viewModel: .init(photoDetails: .Mock.item))
}
