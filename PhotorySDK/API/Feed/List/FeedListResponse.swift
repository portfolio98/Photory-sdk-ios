//
//  FeedListResponse.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/08.
//

import Foundation

struct FeedListResponse: Response, Decodable {
    let status: Int
    let message: String
    
    let feedContents: FeedContent?
    
    typealias RequestType = FeedListRequest
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Int.self, forKey: .status)
        message = try container.decode(String.self, forKey: .message)
        feedContents = try? container.decode(FeedContent.self, forKey: .data)
    }
}
