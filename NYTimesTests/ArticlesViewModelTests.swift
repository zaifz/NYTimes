//
//  ArticlesViewModelTests.swift
//  NYTimesTests
//
//  Created by Huzaifah Mohammed Haris on 27/02/25.
//

import XCTest

class ArticlesViewModelTests: XCTestCase {

    var viewModel: ArticlesViewModel!
    var mockService: ArticleServiceMock!

    override func setUp() {
        super.setUp()
        mockService = ArticleServiceMock()
        viewModel = ArticlesViewModel(service: mockService)
    }
    
    override func tearDown() {
        mockService = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchItemsSuccess() async {
        mockService.apiSuccess = true
        await viewModel.fetchArticles()
        XCTAssertFalse(viewModel.articles.isEmpty, "Items should not be empty after call")
    }
    
    func testFetchItemsFailure() async {
        mockService.apiSuccess = false
        await viewModel.fetchArticles()
        XCTAssertTrue(viewModel.articles.isEmpty)
    }
    
}
