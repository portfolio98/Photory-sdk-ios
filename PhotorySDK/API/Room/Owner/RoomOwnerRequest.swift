//
//  RoomOwnerRequest.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

struct RoomOwnerRequest: Request, Respondable {
    typealias ResponseType = RoomOwnerResponse

    let method: APIClient.Method = .put
    
    var key: String { "room/owner" }
    
    let roomId: Int64
    let delegatedUserId: Int64
    let token = AppStorageManager.token ?? ""
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        guard let data = try? JSONSerialization.data(withJSONObject: [
            "roomId": roomId,
            "delegatedUserId": delegatedUserId
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
