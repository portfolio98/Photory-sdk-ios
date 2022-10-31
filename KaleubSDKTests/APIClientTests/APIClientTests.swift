//
//  APIClient.swift
//  KaleubSDKTests
//
//  Created by Hamlit Jason on 2022/06/28.
//

import XCTest
@testable import PhotorySDK

class APIClientTests: XCTestCase {
    var apiClient: APIClient?
    
    override func setUp() {
        super.setUp()
        
        apiClient = APIClient()
    }

    override func tearDown() {
        super.tearDown()
        
        apiClient = nil
    }
}
    
