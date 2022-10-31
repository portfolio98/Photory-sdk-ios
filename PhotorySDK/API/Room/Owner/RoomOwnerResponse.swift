//
//  RoomOwnerResponse.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

struct RoomOwnerResponse: Response, Decodable {
    let status: Int
    let message: String
    
    typealias RequestType = RoomOwnerRequest
    
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
