//
//  APIClient.SignIn.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

// MARK: - SignIn
extension APIClient {
    // MARK: - signIn
    
    func signIn(email: String, password: String, resultHandler: @escaping (Result<String, Error>) -> Void) {
        let request = SignInRequest(email: email, password: password)
        self.send(request) { result in
            switch result {
            case .success(let response):
                let token = response.data ?? "token nil"
                AppStorageManager.token = token
                resultHandler(.success(token))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
        
    }
    
    func signIn(resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = SignInTokenRequest()
        self.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
}
