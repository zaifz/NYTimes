//
//  BaseNetworkService.swift
//  NYTimes
//
//  Created by Huzaifah Mohammed Haris on 28/02/25.
//

import Foundation

enum NetworkError: Error {
    case invalidData
    case invalidURL
}

class BaseNetworkService<Router: URLRequestConvertible> {
    private let urlSession: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.urlSession = session
    }

    func request<T: Decodable>(_ returnType: T.Type, router: Router) async throws -> T {
        let request = try router.request()
        let (data, _) = try await urlSession.data(for: request)
        
        do {
            let object = try JSONDecoder().decode(returnType, from: data)
            return object
        } catch {
            throw NetworkError.invalidData
        }
    }
}
