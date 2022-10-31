//
//  RoomEnterRequest.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

struct RoomEnterRequest: Request, Respondable {
    typealias ResponseType = RoomEnterResponse

    let method: APIClient.Method = .post
    
    var key: String { "room/participate" }
    
    let code: String
    let password: String
    let token = AppStorageManager.token ?? ""
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        let object = ["code": code, "password": password]
        let data = try? JSONSerialization.data(withJSONObject: object, options: [])
        
        urlRequest.httpBody = data
        
        urlRequest.addValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        urlRequest.addValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
        return urlRequest
    }
}
