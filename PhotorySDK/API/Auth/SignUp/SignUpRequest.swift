//
//  SignUpRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Foundation

struct SignUpRequest: Request, Respondable {
    typealias ResponseType = SignUpResponse
    
    let method: APIClient.Method = .post
    
    var key: String { "auth/signup" }
    
    let email: String
    let password: String
    let nickname: String
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        let object = ["email": email, "password": password, "nickname": nickname]
        let data = try? JSONSerialization.data(withJSONObject: object, options: [])
        urlRequest.httpBody = data
        
        urlRequest.addValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        return urlRequest
    }
}
