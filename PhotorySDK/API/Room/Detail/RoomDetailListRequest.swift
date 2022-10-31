//
//  RoomDetailList.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/07/09.
//

import Foundation
//
//struct RoomDetailRequest: Request, Respondable {
//    typealias ResponseType = RoomDetailResponse
//    let token = AppStorageManager.token ?? ""
//    
//    let method: APIClient.Method = .get
//    
//    var key: String { "room" }
//    
//    func urlRequst(baseURL: URL) -> URLRequest? {
//        guard let url = URL(string: "\(baseURL)/\(key)") else {
//            return nil
//        }
//
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = method.stringValue
//        // NOTE: - UserToken을 넣어야 합니다.
//        urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        return urlRequest
//    }
//}
//
