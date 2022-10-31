//
//  FeedeleteResponse.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/07.
//

import Foundation

struct FeedDeleteResponse: Response, Decodable {
    let status: Int
    let message: String
    
    typealias RequestType = FeedDeleteRequest
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Int.self, forKey: .status)
        message = try container.decode(String.self, forKey: .message)
    }
}
