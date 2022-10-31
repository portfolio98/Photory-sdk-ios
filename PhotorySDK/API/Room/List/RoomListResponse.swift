//
//  RoomListResponse.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Foundation

struct RoomListResponse: Response, Decodable {
    let status: Int
    let message: String
    
    let rooms: [Room]
    
    typealias RequestType = RoomListRequest
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Int.self, forKey: .status)
        message = try container.decode(String.self, forKey: .message)
        rooms = try container.decode([Room].self, forKey: .data)
    }
}
