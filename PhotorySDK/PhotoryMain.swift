//
//  PhotoryMain.swift
//  PhotorySDK
//
//  Created by Jaesung Lee on 2022/06/16.
//

import UIKit

class PhotoryMain {
    let version: String = "1.0.0" // [NEXT_VERSION]
    let roomManager: RoomManager
    let feedManager: FeedManager
    let apiClient: APIClient
    
    init() {
        self.apiClient = APIClient()
        self.roomManager = RoomManager()
        self.feedManager = FeedManager()
    }
    
    // MARK: - Sign up
    func checkEmailValidation(email: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.checkEmailValidation(email: email) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func sendVerificationMail(to email: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.sendVerificationMail(to: email) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func checkAuthKeyValidation(email: String, authKey: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.checkAuthKeyValidation(email: email, authKey: authKey) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func signUp(email: String, password: String, nickname: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.signUp(email: email, password: password, nickname: nickname) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    // MARK: - Sign in
    func signIn(email: String, password: String, resultHandler: @escaping (Result<String, Error>) -> Void) {
        apiClient.signIn(email: email, password: password) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    // TODO: 로그인 유지는 어떻게? 토큰?
    func signIn(resultHandler: @escaping (Result<Void, Error>) -> Void) {
        apiClient.signIn { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    // MARK: - Room
    
    func fetchRoomList(resultHandler: @escaping (Result<[Room], Error>) -> Void) {
        roomManager.fetchRoomList { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func createRoom(title: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        roomManager.createRoom(title: title, password: password) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func enterRoom(code: String, password: String, resultHandler: @escaping (Result<Room?, Error>) -> Void) {
        roomManager.enterRoom(code: code, password: password) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func leaveRoom(roomId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        roomManager.leaveRoom(roomId: roomId) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func disableRoom(roomId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        roomManager.disableRoom(roomId: roomId) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func kickRoom(roomId: Int64, deleteUserId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        roomManager.kickRoom(roomId: roomId, deleteUserId: deleteUserId) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func changePasswordRoom(roomId: Int64, beforePassword: String, afterPassword: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        roomManager.changePasswordRoom(roomId: roomId, beforePassword: beforePassword, afterPassword: afterPassword) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func changeOwnerRoom(roomId: Int64, delegatedUserId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        roomManager.changeOwnerRoom(roomId: roomId, delegatedUserId: delegatedUserId) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    // MARK: - Feed
    
    func createFeed(image: [UIImage], roomId: Int64, title: String, content: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        feedManager.createFeed(image: image, roomId: roomId, title: title, content: content) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func updateFeed(feedId: Int64, title: String, content: String, resultHandler: @escaping (Result<Feed, Error>) -> Void) {
        feedManager.updateFeed(feedId: feedId, title: title, content: content) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func deleteFeed(feedId: Int64, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        feedManager.deleteFeed(feedId: feedId) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func fetchFeedList(roomId: Int64, size: Int, lastFeedId: Int64, resultHandler: @escaping (Result<FeedContent?, Error>) -> Void) {
        feedManager.fetchFeedList(roomId: roomId, size: size, lastFeedId: lastFeedId) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    func feedDetail(feedId: Int64, resultHandler: @escaping (Result<Feed?, Error>) -> Void) {
        feedManager.feedDetail(feedId: feedId) { result in
            DispatchQueue.main.async {
                resultHandler(result)
            }
        }
    }
    
    /// userToken토큰 (고유 id)
    var userToken: String? {
        get { AppStorageManager.token }
        set { AppStorageManager.token = newValue }
    }
    
    
    
    
    
//    // MARK: - Room List
//    func createRoomListQuery(with params: RoomListQuery.Params = .init()) -> RoomListQuery {
//        RoomListQuery(apiClient: apiClient, params: params)
//    }
//
//    // MARK: - Room
//    func createRoom(with params: Room.Params) {
////        roomManager.createRoom(with: params)
//    }
//
//    func enterRoom(id: String) {
//        guard let room = roomManager.rooms[id] else { return }
//        room.enter()
//    }
//
//    func leaveRoom(id: String) {
//        guard let room = roomManager.rooms[id] else { return }
//        room.leave()
//    }
//
//    func deleteRoom(id: String) {
//        guard let room = roomManager.rooms[id] else { return }
//        room.delete()
//    }
//
//    func changePassword(to newPassword: String, forRoomID id: String) {
//        guard let room = roomManager.rooms[id] else { return }
//        room.changePassword(to: newPassword)
//    }
}

