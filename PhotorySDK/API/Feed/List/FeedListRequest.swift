//
//  FeedListRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/08.
//

import Foundation

struct FeedListRequest: Request, Respondable {
    typealias ResponseType = FeedListResponse
    let token = AppStorageManager.token ?? ""
    
    let method: APIClient.Method = .get
    
    var key: String { "feed" }
    var roomId: Int64
    var size: Int
    var lastFeedId: Int64
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        // feed?roomId=&size=&lastFeedId=
        let query = "?roomId=\(roomId)&size=\(size)&lastFeedId=\(lastFeedId)"
        guard let url = URL(string: "\(baseURL)/\(key)/\(query)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
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
