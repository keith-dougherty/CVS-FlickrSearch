//
//  FlickrTests.swift
//  FlickrTests
//
//  Created by Keith Dougherty on 7/13/24.
//

import XCTest
import Dependencies

@testable import Flickr

final class FlickrTests: XCTestCase {

    func testSearch_emptySearchText() async throws {
        let viewModel = SearchViewModel()
        
        XCTAssertEqual(viewModel.searchText, "")
        XCTAssertNil(viewModel.photos)
        
        await viewModel.search()
        
        XCTAssertNil(viewModel.photos)
    }
    
    func test_search_withSearchText() async throws {
//        withDependencies {
//            $0.networkClient.searchPhotos = { Photos.Mock.photos }
//        } operation: {
            let viewModel = SearchViewModel()
            viewModel.searchText = "Cat"
            
            XCTAssertNil(viewModel.photos)
            XCTAssertFalse(viewModel.isSearching)
        
            await viewModel.search()
            
            XCTAssertEqual(viewModel.photos, Photos.Mock.photos)
            XCTAssertFalse(viewModel.isSearching)
//        }
    }
}
