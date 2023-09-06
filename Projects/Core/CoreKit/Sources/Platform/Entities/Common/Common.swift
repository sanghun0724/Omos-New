//
//  Common.swift
//  CoreKit
//
//  Created by 이상헌 on 2023/09/05.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

public struct DJResponse: Codable {
    public let nickname: String
    public let profileURL: String?
    public let userID: Int

    enum CodingKeys: String, CodingKey {
        case nickname
        case profileURL = "profileUrl"
        case userID = "userId"
    }
}
