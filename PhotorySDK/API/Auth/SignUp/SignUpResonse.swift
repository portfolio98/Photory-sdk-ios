//
//  SignUpResonse.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Foundation

struct SignUpResponse: Response, Decodable {
    typealias RequestType = SignUpRequest
    
    let status: Int
    let message: String
    let data: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Int.self, forKey: .status)
        message = try container.decode(String.self, forKey: .message)
        data = try? container.decode(String.self, forKey: .data)
    }
}
