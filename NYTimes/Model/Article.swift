//
//  Article.swift
//  NYTimes
//
//  Created by Huzaifah Mohammed Haris on 27/02/25.
//

import Foundation

struct ArticleResponse: Codable {
    let num_results: Int
    let results: [Article]
}

struct Article: Codable, Identifiable {
    let id: Int
    let title: String
    let published_date: String
    let byline: String
    let abstract: String
}
