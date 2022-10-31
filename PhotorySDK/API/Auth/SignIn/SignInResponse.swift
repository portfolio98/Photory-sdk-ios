//
//  SignInResponse.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

struct SignInResponse: Response, Decodable {
    typealias RequestType = SignInRequest
    
    let status: Int
    let message: String
    let data: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
        
//        enum DataKeys: String, CodingKey {
//            case token
//        }
    }
    
    // NOTE: - 디코딩 이렇게 하는게 맞는지 점검이 필요합니다.
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.DataKeys.self, forKey: .data)
        status = try container.decode(Int.self, forKey: .status)
        message = try container.decode(String.self, forKey: .message)
        data = try? container.decode(String.self, forKey: .data)
        
    }
}
