//
//  APIClientTests.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/06/16.
//

import XCTest
@testable import PhotorySDK

extension APIClientTests {
    
    func test_signIn() throws {
        let email = "heyaeazog07a1@gmail.com"
        let password = "12a3456"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        apiClient?.signIn(email: email, password: password) { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                if let error = error as? APIClient.APIError {
                    XCTFail(error.localizedDescription)
                } else {
                    XCTFail(error.localizedDescription)
                }
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 30)
    }
    
    
    
    func test_signInToken() throws {
        // eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImhleWFlYXpvYTA3YTFAZ21haWwuY29tIiwiaWF0IjoxNjU2MjY1MzgwLCJleHAiOjE2ODc4MDEzODB9.ANYnuCbt5YRqhthB3_HyGD3K6bMQGyqkqFyY1DPjxmM

        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        apiClient?.signIn { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure(let error):
                if let error = error as? APIClient.APIError {
                    XCTFail(error.localizedDescription)
                } else {
                    XCTFail(error.localizedDescription)
                }
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 30)
    }
    
}
