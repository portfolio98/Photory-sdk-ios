//
//  FeedCreateRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/07.
//

import UIKit

struct FeedCreateRequest: Request, Respondable {
    typealias ResponseType = FeedCreateResponse

    let method: APIClient.Method = .post
    
    var key: String { "feed" }
    
    let imageData = Data()
    let image: [UIImage] // NOTE: 어떻게 서버로 보낼까 타입이 뭘까?
    let roomId: Int64
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
            "image": image,
            "roomId": roomId,
            "title": title,
            "content": content
        ] as [String : Any]
        let data = try? JSONSerialization.data(withJSONObject: object, options: [])
        
        urlRequest.httpBody = data
        
        urlRequest.addValue(
            "multipart/form-data",
            forHTTPHeaderField: "Content-Type"
        )
        urlRequest.addValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
        
        return urlRequest
    }
}
