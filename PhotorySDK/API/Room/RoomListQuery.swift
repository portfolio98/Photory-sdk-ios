//
//  RoomListQuery.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

public class RoomListQuery {
    // TODO: 현재는 논의된바가 없어서 서버랑 천천히 추가하면 됨
    public struct Params {
        public init() { }
    }
    
    let apiClient: APIClient
    let params: Params
    
    // TODO: 서버랑 쿼리 조건들에 대한 논의가 필요
    init(apiClient: APIClient, params: Params = .init()) {
        self.apiClient = apiClient
        self.params = params
    }
    
    public func load(resultHandler: @escaping (Result<[Room], Error>) -> Void) {
        apiClient.fetchRoomList { result in
            DispatchQueue.main.async { [result] in
                resultHandler(result)
            }
        }
    }
}
