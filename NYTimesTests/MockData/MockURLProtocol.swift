//
//  MockURLProtocol.swift
//  NYTimes
//
//  Created by Huzaifah Mohammed Haris on 01/03/25.
//

import Foundation

class MockURLProtocol: URLProtocol {
    static var mockResponse: (Data?, URLResponse?, Error?)
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.mockResponse.2 {
            client?.urlProtocol(self, didFailWithError: error)
        } else {
            if let data = MockURLProtocol.mockResponse.0 {
                client?.urlProtocol(self, didLoad: data)
            }
            if let response = MockURLProtocol.mockResponse.1 {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }
}
