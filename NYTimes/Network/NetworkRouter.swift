//
//  NetworkRouter.swift
//  NYTimes
//
//  Created by Huzaifah Mohammed Haris on 28/02/25.
//

import Foundation

protocol URLRequestConvertible {
    func request() throws -> URLRequest
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum NetworkRouter {
    case fetchArticles(String, Int)
    
    var path: String {
        switch self {
        case .fetchArticles(let section, let period):
            return "/svc/mostpopular/v2/mostviewed/\(section)/\(period).json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchArticles:
            return .get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .fetchArticles(_, _):
            return ["api-key": Constants.Api.apiKey]
        }
    }
}

extension NetworkRouter: URLRequestConvertible {
    func request() throws -> URLRequest {
        guard var urlComponents = URLComponents(string: Constants.Api.baseURL + path) else {
            throw NetworkError.invalidURL
        }

        var queryItems = [URLQueryItem]()
        for (key, value) in parameters {
            queryItems.append(URLQueryItem(name: key, value: "\(value)"))
        }
        
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
