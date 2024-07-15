//
//  PhotoDetails.swift
//  Flickr
//
//  Created by Keith Dougherty on 7/14/24.
//

import Foundation

public struct PhotoDetails: Codable, Equatable, Hashable, Identifiable {
    public var id = UUID()
    public var title: String
    public var link: String
   
    public var description: String
    public var author: String
    public var tags: String
    
    public var published: Date
    private var media: [String: String]
    
    public var mediaURL: URL? {
        guard let mediaURL = media["m"] else { return nil }
        return URL(string: mediaURL)
    }
    
    public init(title: String,
         link: String,
         media: [String : String],
         description: String,
         author: String,
         published: String,
         tags: String) {
        self.title = title
        self.link = link
        self.description = description
        self.author = author
        self.tags = tags
        self.media = media
        self.published = published.toDate()
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.link = try container.decode(String.self, forKey: .link)
        self.description = try container.decode(String.self, forKey: .description)
        self.author = try container.decode(String.self, forKey: .author)
        self.tags = try container.decode(String.self, forKey: .tags)
        self.media = try container.decode([String : String].self, forKey: .media)
        self.published = try container.decode(String.self, forKey: .published).toDate()
    }
}

extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
        return date
    }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy at HH:mm"
        return dateFormatter.string(from: self)
    }
}
