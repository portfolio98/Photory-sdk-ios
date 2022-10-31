//
//  SignInTokenRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

struct SignInTokenRequest: Request, Respondable {
    typealias ResponseType = SignInResponse
    let token = AppStorageManager.token ?? ""
    
    let method: APIClient.Method = .get
    
    var key: String { "auth/check" }
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        urlRequest.addValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
        
        return urlRequest
    }
}
