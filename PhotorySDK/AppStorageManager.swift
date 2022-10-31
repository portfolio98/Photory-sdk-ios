//
//  AppStorageManager.swift
//  PhotorySDK
//
//  Created by Hamlit Jason on 2022/06/17.
//

import Foundation
import SwiftUI

class AppStorageManager {
    @AppStorage(StringSet.userToken)
    static var token: String?
}
