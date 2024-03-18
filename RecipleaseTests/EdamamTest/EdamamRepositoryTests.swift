//
//  EdamamRepositoryTests.swift
//  RecipleaseTests
//
//  Created by MARTEAU Dylan on 21/02/2024.
//

import XCTest
@testable import Reciplease

//class EdamamRepositoryTests: XCTestCase {
//    
//    func testGetRecipesRepo_SuccessfulResponse() {
//        let session = MockURLSession(data: ResponseDataMockEdamam.edamamCorrectData, response: ResponseDataMockEdamam.responseOk, error: nil)
//        let repository = EdamamRepository(session: session)
//        let expectation = self.expectation(description: "Completion handler called")
//        var responseError: Error?
//        var responseData: EdamamModel?
//        var successFlag = false
//
//        repository.getRecipesRepo(for: ["chicken"]) { success, data in
//            successFlag = success
//            responseData = data
//            expectation.fulfill()
//        }
//
//        waitForExpectations(timeout: 5, handler: nil)
//        XCTAssertTrue(successFlag)
//        XCTAssertNotNil(responseData)
//        XCTAssertNil(responseError)
//    }
//    
//    func testGetRecipesRepo_ErrorResponse() {
//        // Configuration avec une réponse d'erreur
//        let session = MockURLSession(data: nil, response: nil, error: MockError.someNetworkError)
//        let repository = EdamamRepository(session: session)
//        let expectation = self.expectation(description: "ErrorResponse")
//        var responseData: EdamamModel?
//        var successFlag = false
//
//        // Appel de la méthode
//        repository.getRecipesRepo(for: ["chicken"]) { success, data in
//            responseData = data
//            successFlag = success
//            expectation.fulfill()
//        }
//
//        // Attente et assertions
//        waitForExpectations(timeout: 5, handler: nil)
//        XCTAssertFalse(successFlag)
//        XCTAssertNil(responseData)
//    }
//    
//    func testGetRecipesRepo_InvalidData() {
//        // Configuration avec des données invalides
//        let session = MockURLSession(data: ResponseDataMockEdamam.edamamIncorrectData, response: ResponseDataMockEdamam.responseOk, error: nil)
//        let repository = EdamamRepository(session: session)
//        let expectation = self.expectation(description: "InvalidData")
//        var responseData: EdamamModel?
//        var successFlag = false
//
//        // Appel de la méthode
//        repository.getRecipesRepo(for: ["chicken"]) { success, data in
//            responseData = data
//            successFlag = success
//            expectation.fulfill()
//        }
//
//        // Attente et assertions
//        waitForExpectations(timeout: 5, handler: nil)
//        XCTAssertFalse(successFlag)
//        XCTAssertNil(responseData)
//    }
//    
//}
    
    //     retirer callback et revoir la signature
    //     et revoir ce qu'on veut tester
    //     revoir sur edamamrepositiry  getchicken
    //        func testGetRecipeWithResponseOk(callBack: @escaping (Bool, Data?) -> Void) {
    //            let url = ResponseDataMockEdamam.responseOk.url!
    //
    //            AF.request(url).responseData { response in
    //                switch response.result {
    //                case .success(let data):
    //                    callBack(true, data)
    //                    XCTAssert(true)
    //                case .failure:
    //                    callBack(false, nil)
    //                    XCTAssert(false)
    //                }
    //            }
    //        }
    
    

