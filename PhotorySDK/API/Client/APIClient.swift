//
//  APIClient.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Combine
import PhotoryKey

class APIClient: ObservableObject {
    static let urlString: String = {
        // TODO: DEBUG, PRODUCTION
        return PhotoryKey.urlString
    }()

    let version: String = "/v1"
        
    enum Method {
        case post
        case get
        case delete
        case put

        var stringValue: String {
            switch self {
            case .post: return "POST"
            case .get: return "GET"
            case .delete: return "DELETE"
            case .put: return "PUT"
            }
        }
    }

    enum APIError: Error {
        case invalidURLRequest
        case noDataFromResponse
        case failedToRequest
        case failedToDecodeResponse
        case statusCode(_ statusCode: Int, _ message: String)
        
        var localizedDescription: String {
            switch self {
            case .statusCode(let statusCode, let message):
                print("🚨 statusCode \(statusCode)")
                return (400..<500) ~= statusCode ? message : "네트워크 에러가 발생했습니다."
            default:
                return "네트워크 에러가 발생했습니다."
            }
        }
    }

    let baseURL: URL

    init(urlString: String = APIClient.urlString) {
        guard let baseURL = URL(string: urlString + version) else {
            fatalError("Failed to create URL from \(urlString)\(version)")
        }

        self.baseURL = baseURL
    }

    func send<RequestType: Request & Respondable>(_ request: RequestType, resultHandler: @escaping (Result<RequestType.ResponseType, Error>) -> Void) {
        
        guard var urlRequest = request.urlRequst(baseURL: baseURL) else {
            resultHandler(.failure(APIError.invalidURLRequest))
            return
        }
        
        urlRequest.timeoutInterval = 30
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                resultHandler(.failure(error))
                return
            }
            
            guard let data = data else {
                resultHandler(.failure(APIError.noDataFromResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                resultHandler(.failure(APIError.failedToRequest))
                return
            }
            
            guard (200..<300) ~= response.statusCode else {
                if let output = try? JSONDecoder().decode(RequestType.ResponseType.self, from: data) {
                    resultHandler(.failure(APIError.statusCode(response.statusCode, output.message)))
                } else {
                    resultHandler(.failure(APIError.statusCode(response.statusCode, "")))
                }
                return
            }
            
            guard let output = try? JSONDecoder().decode(RequestType.ResponseType.self, from: data) else {
                resultHandler(.failure(APIError.failedToDecodeResponse))
                return
            }
            
            resultHandler(.success(output))
        }
        .resume()
    }
}
