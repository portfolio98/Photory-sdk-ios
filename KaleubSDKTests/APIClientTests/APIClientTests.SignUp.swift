//
//  APIClientsTests.SignUp.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/06/28.
//

import XCTest
@testable import PhotorySDK

extension APIClientTests {
    func test_signUp() throws {
        // TODO: 랜덤 계정 알고리즘 구현
        let email = "heyaeazog07a1@gmail.com"
        let password = "12a3456"
        let nickname = "호나우지뉴!"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.signUp(email: email, password: password, nickname: nickname) { result in
            switch result {
            case .success:
                XCTAssertTrue(true)
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
    
    func test_checkEmailValidation() {
        // statusCode: 200 - KaleubSDK.APIClient.APIError 오류 4. 디코딩 에러
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.checkEmailValidation(email: "heyaeosn13@gmail.com") { result in
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
    
    func test_sendVerificationMail() {
        // statusCode: 200 - KaleubSDK.APIClient.APIError 오류 4. 디코딩 에러
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.sendVerificationMail(to: "heya7@gmail.com") { result in
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
    
    func test_checkAuthKeyValidation() {
        let email: String = "teset@gmail.com"
        let authKey: String = "123456"
        
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.checkAuthKeyValidation(email: email, authKey: authKey) { result in
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
