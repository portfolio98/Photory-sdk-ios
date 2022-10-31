//
//  RoomCreateResponse.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

//  "status": 200,
//"message": "방 생성 성공",
//"data": {
//    "id": 1,
//    "code": "WGZ2W436",
//    "ownerEmail": "orijoon98@gmail.com",
//    "title": "제목",
//    "password": "$2a$10$6AsQCmM2hlFtdE5rXkK.2uDjJV4T6cPObQajjJCXccSzxKZ3LnpZG",
//    "createdDate": "2022-06-14 19:36:23",
//    "modifiedDate": "2022-06-14 19:36:23"
//    "status": true
//}
struct RoomCreateResponse: Response, Decodable {
    let status: Int
    let message: String
    
    let room: Room?
    
    typealias RequestType = RoomCreateRequest
    
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

