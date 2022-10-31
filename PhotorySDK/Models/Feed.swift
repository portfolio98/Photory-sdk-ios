//
//  Feed.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/07.
//

import Foundation

public class Feed: Codable {
    
    /// 방 아이디
    public var roomId: Int64
    /// 작성자 아이디
    public var userId: Int64
    /// 피드 제목
    public var title: String
    /// 피드 내용
    public var content: String
    /// 피드 사진
    public var imageUrls: [String]
    
    public init(
        roomId: Int64,
        userId: Int64,
        title: String,
        content: String,
        imageUrls: [String]
    ) {
        self.roomId = roomId
        self.userId = userId
        self.title = title
        self.content = content
        self.imageUrls = imageUrls
        // NOTE: - imageUrl 바로 UIImage로 바꿔버릴까??
    }
    
    enum CodingKeys: String, CodingKey {
        case roomId
        case userId
        case title
        case content
        case imageUrls
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.roomId = try container.decode(Int64.self, forKey: .roomId)
        self.userId = try container.decode(Int64.self, forKey: .userId)
        self.title = try container.decode(String.self, forKey: .title)
        self.content = try container.decode(String.self, forKey: .content)
        self.imageUrls = try container.decode([String].self, forKey: .imageUrls)
    }
}
