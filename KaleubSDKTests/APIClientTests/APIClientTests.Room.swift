//
//  APIClientTests.Room.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/06/28.
//

import XCTest
@testable import PhotorySDK

extension APIClientTests {
    func test_createRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.createRoom(title: "첫번쨰방", password: "123a456") { result in
            switch result {
            case .success(let response):
                print("✅ response \(response?.code)") // T1464V01
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

    // NOTE: - 바꾼 코드는 없는데, 어제 밤에는 실패하던 코드가 오늘 아침에 해보니까 통과함
    func test_enterRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        // T1464V01, 123a456
        apiClient?.enterRoom(code: "86LY0W49", password: "123a456") { result in
            switch result {
            case .success(let response):
                print("✅ response \(response?.code)") // 86LY0W49
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
    
    // NOTE: - 방 조회
    func test_fetchRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        // T1464V01, 123a456
        apiClient?.fetchRoomList { result in
            switch result {
            case .success(let response):
                response.forEach { room in
                    print("✅ room code \(room.code) id \(room.id) password \(room.password) state \(room.state) ")
                    
                }
                
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

    // NOTE: - 방 나가기
    func test_leaveRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        // T1464V01, 123a456
        apiClient?.leaveRoom(roomId: 1) { result in
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
    
    func test_disableRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        apiClient?.disableRoom(roomId: 1) { result in
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
    
    func test_kickRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        let roomId: Int64 = 1
        let deleteUserId: Int64 = 2
        
        apiClient?.kickRoom(roomId: roomId, deleteUserId: deleteUserId) { result in
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
    
    // NOTE: - 이전 비밀번호 입력이 굳이 필요할 거 같음. 이거 없애는거 논의
    func test_passwordRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        let roomId: Int64 = 1
        let beforePassword: String = "abcde456"
        let afterPassword: String = "abcde456"
        
        apiClient?.passwordRoom(roomId: roomId, beforePassword: beforePassword, afterPassword: afterPassword) { result in
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
    
    // NOTE: 테스트케이스 실패. 현재 방 상세정보에 대한 API가 없어서 서버가 보충 후에 보완하기
    func test_changeOwnerRoom() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1

        let roomId: Int64 = 1
        let delegatedUserId: Int64 = 2

        apiClient?.changeOwnerRoom(roomId: roomId, delegatedUserId: delegatedUserId){ result in
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
}
