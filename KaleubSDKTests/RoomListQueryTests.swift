////
////  RoomListQueryTests.swift
////  KaleubSDKTests
////
////  Created by Jaesung Lee on 2022/06/21.
////
//
//import XCTest
//@testable import PhotorySDK
//
//class RoomListQueryTests: XCTestCase {
//
//    var query: RoomListQuery?
//    
//    override func setUp() {
//        super.setUp()
//        
//        continueAfterFailure = false
//    }
//    
//    func test_fetchRooms() throws {
//        let expectation = XCTestExpectation()
//        expectation.expectedFulfillmentCount = 1
//        
//        self.query = PhotoryMain().createRoomListQuery()
//        self.query?.load { result in
//            switch result {
//            case .success(let rooms):
//                print(rooms.compactMap { $0.title })
//                XCTAssert(!rooms.isEmpty)
//            case .failure(let error):
//                if let error = error as? APIClient.APIError {
//                    XCTFail(error.localizedDescription)
//                } else {
//                    XCTFail(error.localizedDescription)
//                }
//            }
//            expectation.fulfill()
//        }
//        
//        wait(for: [expectation], timeout: 30)
//    }
//}
