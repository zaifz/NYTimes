//
//  ArticleService.swift
//  NYTimes
//
//  Created by Huzaifah Mohammed Haris on 28/02/25.
//

import Foundation

protocol ArticleServiceProtocol {
    func fetchArticles() async throws -> [Article]
}

class ArticleService: BaseNetworkService<NetworkRouter>, ArticleServiceProtocol {
    
    func fetchArticles() async throws -> [Article] {
        let itemResponse = try await request(ArticleResponse.self, router: .fetchArticles("all-sections", 7))
        return itemResponse.results
    }
    
}
