//
//  Room.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/16.
//

import Foundation

public class Room: Codable {
    
    /// 방 생성시간
    public var createdDate: Double
    /// 방 수정시간
    public var modifiedDate: Double
    /// 방 id
    public let id: Int64
    /// 방 코드
    public var code: String
    /// 방장 이메일
    public var ownerEmail: String
    /// 방 제목
    public var title: String
    /// 방 비밀번호(암호화)
    public var password: String
    /// 방 참여인원
    public var participantsCount: Int
    /// 방 활성화 상태
    public var state: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case code
        case ownerEmail
        case title
        case password
        case participantsCount
        case createdDate = "createdAt"
        case modifiedDate = "updatedAt"
        case state = "status"
    }
    
    var apiClient: APIClient!
    
    init(
        id: Int64,
        code: String,
        ownerEmail: String,
        title: String,
        password: String,
        participantsCount: Int = 0,
        createdDate: Double,
        modifiedDate: Double,
        apiClient: APIClient,
        state: Bool
    ) {
        self.id = id
        self.code = code
        self.ownerEmail = ownerEmail
        self.title = title
        self.password = password
        self.participantsCount = participantsCount
        self.createdDate = createdDate
        self.modifiedDate = modifiedDate
        self.state = state
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int64.self, forKey: .id)
        self.code = try container.decode(String.self, forKey: .code)
        self.ownerEmail = try container.decode(String.self, forKey: .ownerEmail)
        self.title = try container.decode(String.self, forKey: .title)
        self.password = try container.decode(String.self, forKey: .password)
        self.participantsCount = (try? container.decode(Int.self, forKey: .participantsCount)) ?? 0
        self.createdDate = try container.decode(Double.self, forKey: .createdDate)
        self.modifiedDate = try container.decode(Double.self, forKey: .modifiedDate)
        self.state = try container.decode(Bool.self, forKey: .state)
    }
    
    // NOTE: - 어떻게 사용해야 할까요?
    public enum Role {
        case host
        case pariticipant
    }
    
    public struct Params {
        
    }
    
    func enter() {
        
    }
    
    func leave() {
        
    }
    
    func delete() {
        
    }
    
    // MARK: HOST
    func changePassword(to newPassword: String) {
        
    }
    
    func kick(userID: String) {
        
    }
    
    func changeRole(to newRole: Room.Role, forUserID userID: String) {
        
    }
}
