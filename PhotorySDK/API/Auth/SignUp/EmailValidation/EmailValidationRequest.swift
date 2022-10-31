//
//  EmailValidationRequest.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

struct EmailValidationRequest: Request, Respondable {
    typealias ResponseType = EmailValidationResponse
    let email: String
    
    let method: APIClient.Method = .post
    
    var key: String { "auth/signup/email/check" }
    
    func urlRequst(baseURL: URL) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/\(key)") else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.stringValue
        
        let object = ["email": email]
        let data = try? JSONSerialization.data(withJSONObject: object, options: [])
        urlRequest.httpBody = data
        
        urlRequest.addValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        return urlRequest
    }
}
