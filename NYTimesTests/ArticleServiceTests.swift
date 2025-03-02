//
//  ArticleServiceTest.swift
//  NYTimesTests
//
//  Created by Huzaifah Mohammed Haris on 01/03/25.
//

import XCTest
@testable import NYTimes

class ArticleServiceTests: XCTestCase {
    
    var service: ArticleService!
    
    override func setUp() {
        super.setUp()
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let mockUrlSession = URLSession(configuration: config)
        
        service = ArticleService(session: mockUrlSession)
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }

    func testSuccessDecoding() async {
        let mockJSON = """
        {
           "num_results": 2,
           "results": [
               {
                   "id": 1,
                   "title": "Test Title",
                   "published_date": "1-2-3",
                   "byline": "Test Byline",
                   "abstract": "Test abstract"
               }
           ]
        }
        """.data(using: .utf8)!

        let response = HTTPURLResponse(url: URL(string: "http://test.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        MockURLProtocol.mockResponse = ( mockJSON, response, nil )
        
        do {
            let articleData = try await service.fetchArticles()
            XCTAssertEqual(articleData.first!.byline, "Test Byline")
        } catch {
            XCTFail("Expecting success. Received Error: \(error.localizedDescription)")
        }
    }
    
    func testFailedDecoding() async {
        let invalidJson = Data("Invalid JSON".utf8)
        let response = HTTPURLResponse(url: URL(string: "http://test.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        MockURLProtocol.mockResponse = ( invalidJson, response, nil )

        do {
            let _ = try await service.fetchArticles()
            XCTFail("Expected decode error but got success")
        } catch NetworkError.invalidData {
            XCTAssertTrue(true) // Expected Result
        } catch {
            XCTFail("Unexpected error - \(error.localizedDescription)")
        }
    }
}
