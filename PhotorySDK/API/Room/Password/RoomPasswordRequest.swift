//
//  RoomPasswordRequest.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

struct RoomPasswordRequest: Request, Respondable {
    typealias ResponseType = RoomPasswordResponse
    
    let method: APIClient.Method = .put
    
    var key: String { "room/password" }
    
    let roomId: Int64
    let beforePassword: String
    let afterPassword: String
    let token = AppStorageManager.token ?? ""
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        guard let data = try? JSONSerialization.data(withJSONObject: [
            "roomId": roomId,
            "beforePassword": beforePassword,
            "afterPassword": afterPassword
        ]) else { return nil }
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
