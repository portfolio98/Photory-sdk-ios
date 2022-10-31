//
//  Request.swift
//  KaleubSDK
//
//  Created by Hamlit Jason on 2022/06/16.
//

import Foundation

protocol Request {
    func urlRequst(baseURL: URL) -> URLRequest?

    var key: String { get }
}

protocol Respondable {
    associatedtype ResponseType: Response
}

protocol OnlyRequestable {

}
