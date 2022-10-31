//
//  RoomManager.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/08/15.
//

import Foundation

class RoomManager {
    let apiClient = APIClient()
    var rooms: [String: Room] = [:]
    
    func createRoom(title: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        let request = RoomCreateRequest(title: title, password: password)
        apiClient.send(request) { result in
            switch result {
            case .success(let response):
                let room = response.room
                resultHandler(.success(room))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func fetchRoomList(resultHandler: @escaping (Result<[Room], Error>) -> Void) {
        let request = RoomListRequest()
        apiClient.send(request) { result in
            switch result {
            case .success(let response):
                let rooms = response.rooms
                resultHandler(.success(rooms))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func enterRoom(code: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        let request = RoomEnterRequest(code: code, password: password)
        apiClient.send(request) { result in
            switch result {
            case .success(let response):
                let room = response.room
                resultHandler(.success(room))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func leaveRoom(roomId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = RoomLeaveRequest(roomId: roomId)
        apiClient.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func disableRoom(roomId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = RoomDisableRequest(roomId: roomId)
        apiClient.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func kickRoom(roomId: Int64, deleteUserId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = RoomKickRequest(roomId: roomId, deletedUserId: deleteUserId)
        apiClient.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func changePasswordRoom(roomId: Int64, beforePassword: String, afterPassword: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = RoomPasswordRequest(roomId: roomId, beforePassword: beforePassword, afterPassword: afterPassword)
        apiClient.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func changeOwnerRoom(roomId: Int64, delegatedUserId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = RoomOwnerRequest(roomId: roomId, delegatedUserId: delegatedUserId)
        apiClient.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
}
