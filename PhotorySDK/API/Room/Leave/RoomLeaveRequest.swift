//
//  RoomLeaveRequest.swift
//  KaleubSDK
//
//  Created by Jaesung Lee on 2022/06/21.
//

import Foundation

struct RoomLeaveRequest: Request, Respondable {
    typealias ResponseType = RoomLeaveResponse

    let method: APIClient.Method = .delete
    
    var key: String { "room/participate" }
    
    let roomId: Int64
    let token = AppStorageManager.token ?? ""
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        guard let data = try? JSONSerialization.data(withJSONObject: [
            "roomId": roomId
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

