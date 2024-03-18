//
//  MockURLSessionDataTask.swift
//  RecipleaseTests
//
//  Created by MARTEAU Dylan on 07/03/2024.
//

//import Foundation
//
//class MockURLSessionDataTask: URLSessionDataTask {
//    private let data: Data?
//    private let response: URLResponse?
//    private let sessionError: Error?
//
//    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
//
//    init(data: Data?, response: URLResponse?, error: Error?) {
//        self.data = data
//        self.response = response
//        self.sessionError = error
//    }
//
//    override func resume() {
//        completionHandler?(data, response, sessionError)
//    }
//}
