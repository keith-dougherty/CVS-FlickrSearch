//
//  NetworkManager.swift
//  Flickr
//
//  Created by Keith Dougherty on 7/13/24.
//

import Alamofire
import Foundation

final public class NetworkManager {
    public func searchPhotos(_ tags: String) async throws -> Photos  {
        let response = await AF.request(Router.search(tags: tags))
            .cURLDescription { description in
                print(description)
            }
            .serializingDecodable(Photos.self)
            .response
        
        switch response.result {
        case let .success(photos):
            return photos
        case let .failure(error):
            throw error
        }
    }
}

extension NetworkManager {
    private enum Router: URLRequestConvertible {
        case search(tags: String)
        
        static let baseURLString = "https://api.flickr.com"
        
        func asURLRequest() throws -> URLRequest {
            let result: (path: String, parameters: Parameters) = {
                switch self {
                case let .search(tags):
                    return ("/services/feeds/photos_public.gne", ["tags": tags, "format": "json", "nojsoncallback": "1"])
                }
            }()
            
            let url = try Router.baseURLString.asURL()
            let urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
            return try URLEncoding.default.encode(urlRequest, with: result.parameters)
        }
    }
}
