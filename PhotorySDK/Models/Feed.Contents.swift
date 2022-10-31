//
//  Feed.Contents.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/09.
//

import Foundation

// 이 부분은 방에서 전체 피드를 보여주는 부분입니다.
public class FeedContent: Codable {
    // NOTE: - 이 부분은 contents로 감싸서 내려옴
    
    public struct Contents: Codable {
        public var createdDate: Double
        /// 피드 수정시간
        public var modifiedDate: Double
        /// 피드 아이디
        public var feedId: Int64
        /// 유저 아이디
        public var userId: Int64
        /// 방 제목
        public var title: String
        /// 내용
        public var content: String
        /// 이미지 URLs
        public var imageUrls: [String]
    }
    
    /// 룸에 나타나는 피드 상세 컨텐츠
    public var contents: [Contents]
    
    // NOTE: - 여기는 따로!
    /// 전체 피드 개수
    public var totalElements: Int64
    /// 다음 요청으로 보낼 lastFeedId -1 이면 요청 끝
    public var nextCursor: Int64
    
    public init(
        contents: [Contents],
        totalElements: Int64,
        nextCursor: Int64
    ) {
        self.contents = contents
        self.totalElements = totalElements
        self.nextCursor = nextCursor
    }
    
    enum CodingKeys: String, CodingKey {
        case contents
        case totalElements
        case nextCursor
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contents = try container.decode([Contents].self, forKey: .contents)
        self.totalElements = try container.decode(Int64.self, forKey: .totalElements)
        self.nextCursor = try container.decode(Int64.self, forKey: .nextCursor)
    }
}
