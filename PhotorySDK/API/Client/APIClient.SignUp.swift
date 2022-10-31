//
//  APIClient.SignUp.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation

// MARK: - SignUp

extension APIClient {
    func signUp(email: String, password: String, nickname: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = SignUpRequest(email: email, password: password, nickname: nickname)
        self.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func checkEmailValidation(email: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = EmailValidationRequest(email: email)
        self.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func sendVerificationMail(to email: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = SendVerificationMailRequest(email: email)
        self.send(request) { result in
            switch result {
            case .success:
                resultHandler(.success(()))
            case .failure(let error):
                resultHandler(.failure(error))
            }
        }
    }
    
    func checkAuthKeyValidation(email: String, authKey: String, resultHandler: @escaping (Result<Void, Error>) -> Void) {
        let request = AuthKeyValidationRequest(email: email, authKey: authKey)
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
