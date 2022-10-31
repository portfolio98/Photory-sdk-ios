//
//  FeedUpdateRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/07.
//

import UIKit

struct FeedUpdateRequest: Request, Respondable {
    typealias ResponseType = FeedUpdateResponse
    
    let method: APIClient.Method = .put
    
    var key: String { "feed" }
    
    let feedId: Int64
    let title: String
    let content: String
    let token = AppStorageManager.token ?? ""
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        let object = [
            "feedId": feedId,
            "title": title,
            "content": content
        ] as [String : Any]
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
