//
//  FeedeleteRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/07.
//

import Foundation

struct FeedDeleteRequest: Request, Respondable {
    typealias ResponseType = FeedDeleteResponse

    let method: APIClient.Method = .delete
    
    var key: String { "feed" }
    
    let feedId: Int64
    let token = AppStorageManager.token ?? ""
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        guard let data = try? JSONSerialization.data(withJSONObject: [
            "feedId": feedId
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

