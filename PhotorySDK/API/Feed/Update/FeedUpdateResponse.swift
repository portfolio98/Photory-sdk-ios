//
//  FeedUpdateResponse.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/07.
//

import Foundation

struct FeedUpdateResponse: Response, Decodable {
    let status: Int
    let message: String
    
    let feed: Feed
    
    typealias RequestType = FeedUpdateRequest
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Int.self, forKey: .status)
        message = try container.decode(String.self, forKey: .message)
        feed = try container.decode(Feed.self, forKey: .data)
    }
}



