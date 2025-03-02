//
//  NetworkManager.swift
//  NYTimesTests
//
//  Created by Huzaifah Mohammed Haris on 27/02/25.
//

import Foundation

enum TestError: Error {
    case runtimeError(String)
}

class ArticleServiceMock: ArticleServiceProtocol {
    
    var apiSuccess = false
    let mockItems = [Article(id: 1, title: "Title 1", published_date: "1-1-1", byline: "By Author 1", abstract: "Test"),                                       Article(id: 1, title: "Title 2", published_date: "2-2-2", byline: "By Author 2", abstract: "Test"),
                     Article(id: 1, title: "Title 3", published_date: "3-3-3", byline: "By Author 3", abstract: "Test")]
    
    func fetchArticles() async throws -> [Article] {
        if apiSuccess {
            return mockItems
        } else {
            throw TestError.runtimeError("apiSuccess is set to false")
        }
    }
    
}
