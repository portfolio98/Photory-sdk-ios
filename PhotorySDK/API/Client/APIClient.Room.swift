//
//  APIClient.RoomFetch.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

// NOTE: - RoomManager로 코드를 이관할 예정
extension APIClient {
    // NOTE: - 이관
    func createRoom(title: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        let request = RoomCreateRequest(title: title, password: password)
        self.send(request) { result in
            switch result {
            case .success(let response):
                let room = response.room
                resultHandler(.success(room))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    // NOTE: - 이관
    func enterRoom(code: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        let request = RoomEnterRequest(code: code, password: password)
        self.send(request) { result in
            switch result {
            case .success(let response):
                let room = response.room
                resultHandler(.success(room))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    // NOTE: - 이관
    func fetchRoomList(resultHandler: @escaping (Result<[Room], Error>) -> Void) {
        let request = RoomListRequest()
        self.send(request) { result in
            switch result {
            case .success(let response):
                let rooms = response.rooms
//                rooms.forEach { $0.apiClient = self } 해당 로직 파악 어려워서 주석처리
                resultHandler(.success(rooms))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    //NOTE: - 이관
    func leaveRoom(roomId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = RoomLeaveRequest(roomId: roomId)
        self.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    //NOTE: - 이관
    func disableRoom(roomId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = RoomDisableRequest(roomId: roomId)
        self.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    //NOTE: - 이관
    func kickRoom(roomId: Int64, deleteUserId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = RoomKickRequest(roomId: roomId, deletedUserId: deleteUserId)
        self.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    //NOTE: - 이관
    func passwordRoom(roomId: Int64, beforePassword: String, afterPassword: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = RoomPasswordRequest(roomId: roomId, beforePassword: beforePassword, afterPassword: afterPassword)
        self.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    //NOTE: - 이관
    func changeOwnerRoom(roomId: Int64, delegatedUserId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = RoomOwnerRequest(roomId: roomId, delegatedUserId: delegatedUserId)
        self.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
}
