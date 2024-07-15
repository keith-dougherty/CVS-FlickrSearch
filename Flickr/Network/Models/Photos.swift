//
//  Photos.swift
//  Flickr
//
//  Created by Keith Dougherty on 7/14/24.
//

import Foundation

public struct Photos: Codable, Equatable, Hashable {
    var title: String
    var link: String
    var description: String
    var items: [PhotoDetails]
}
