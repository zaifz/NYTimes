//
//  ArticlesViewModel.swift
//  NYTimes
//
//  Created by Huzaifah Mohammed Haris on 27/02/25.
//

import Foundation


class ArticlesViewModel: ObservableObject {
    
    @Published private(set) var articles: [Article] = []
    @Published var isLoading = false
    
    private let service: ArticleServiceProtocol
    
    init(service: ArticleServiceProtocol = ArticleService()) {
        self.service = service
    }
    
    @MainActor
    func fetchArticles() async {
        isLoading = true
        do {
            articles = try await service.fetchArticles()
        } catch {
            print(error.localizedDescription)
        }
        isLoading = false
    }
    
}

