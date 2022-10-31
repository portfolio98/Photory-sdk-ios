//
//  Response.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Foundation

protocol Response: Decodable {
    associatedtype RequestType: Request
    
    var status: Int { get }
    var message: String { get }
}
