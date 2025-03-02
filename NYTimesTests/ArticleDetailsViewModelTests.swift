//
//  ArticleDetailsViewModelTests.swift
//  NYTimesTests
//
//  Created by Huzaifah Mohammed Haris on 27/02/25.
//

import XCTest
@testable import NYTimes

class ArticleDetailsViewModelTests: XCTestCase {
    
    func testDetailsViewModel() {
        let article = Article(id: 1, title: "Article Test Title", published_date: "1-2-3", byline: "Article ByLine", abstract: "Sample")
        let viewModel = ArticleDetailsViewModel(article: article)
        
        XCTAssertEqual(viewModel.article.title, "Article Test Title")
        XCTAssertEqual(viewModel.article.byline, "Article ByLine")
    }
    
}
