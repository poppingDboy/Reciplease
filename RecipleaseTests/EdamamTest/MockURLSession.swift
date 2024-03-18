//
//  MockURLSession.swift
//  RecipleaseTests
//
//  Created by MARTEAU Dylan on 07/03/2024.
//

import Foundation

class MockURLSession: URLSession {
    private let mockDataTask: MockURLSessionDataTask

    init(data: Data?, response: URLResponse?, error: Error?) {
        self.mockDataTask = MockURLSessionDataTask(data: data, response: response, error: error)
        super.init()
    }

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        mockDataTask.completionHandler = completionHandler
        return mockDataTask
    }
    
}
