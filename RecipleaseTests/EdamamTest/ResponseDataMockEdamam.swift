//
//  ResponseDataMockEdamam.swift
//  RecipleaseTests
//
//  Created by MARTEAU Dylan on 21/02/2024.
//

import Foundation

enum MockErrorEdamam: Error {
    case responseError(HTTPURLResponse)
}

class ResponseDataMockEdamam {
    static let responseOk = HTTPURLResponse(url: URL(string: "http://rightAdress.com/")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    static let responseKO = HTTPURLResponse(url: URL(string: "http://wrongAdress.com/")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    static let responseKOError = MockErrorEdamam.responseError(responseKO)
    
    static var edamamCorrectData: Data {
        let bundle = Bundle(for: ResponseDataMockEdamam.self)
        
        guard let url = bundle.url(forResource: "edamam", withExtension: "json") else {
            fatalError("Unable to find 'edamam.json' in the bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            fatalError("Error loading data from 'edamam.json': \(error)")
        }
    }
    
    static let edamamIncorrectData = "error".data(using: .utf8)!
}

