//
//  RoomEnterResponse.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

struct RoomEnterResponse: Response, Decodable {
    let status: Int
    let message: String
    
    let room: Room?
    
    typealias RequestType = RoomEnterRequest
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Int.self, forKey: .status)
        message = try container.decode(String.self, forKey: .message)
        room = try? container.decode(Room.self, forKey: .data)
    }
}
