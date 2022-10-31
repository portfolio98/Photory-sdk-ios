//
//  APIClientTests.Feed.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/07/07.
//

import XCTest
import Alamofire
@testable import PhotorySDK

extension APIClientTests {
    // FIXME: multipart/form-data로 이미지 전송
    func test_createFeed() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        let image: [UIImage] = []
        let roomId: Int64 = 1
        let title: String = ""
        let content: String = ""
        
        apiClient?.createFeed(image: image, roomId: roomId, title: title, content: content) { result in
            switch result {
            case .success:
                print("✅")
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
    
    // FIXME: 얘 갑자기 왜 안돼??
    func test_updateFeed() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        let feedId: Int64 = 1
        let title: String = "도라에몽"
        let content: String = "뚜비나나뽀"
        
        apiClient?.updateFeed(feedId: feedId, title: title, content: content) { result in
            switch result {
            case .success:
                print("✅")
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
    
    func test_deleteFeed() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        let feedId: Int64 = 1
        
        apiClient?.deleateFeed(feedId: feedId) { result in
            switch result {
            case .success:
                print("✅")
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
    
    // FIXME: 요청 자체 실패, API 문서 다시 확인하기
    func test_fetchFeed() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        let roomId: Int64 = 1
        let size: Int = 1
        let lastFeedId: Int64 = 1
        
        apiClient?.fetchFeedList(roomId: roomId, size: size, lastFeedId: lastFeedId) { result in
            switch result {
            case .success(let resonse):
                print(resonse?.contents)
                print("✅")
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
    
    // MARK: - Alamofire로 multipart 테스트
    func test_AF_createFeed() {
        
    }
    
}
