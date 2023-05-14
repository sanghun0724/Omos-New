//
//  Lists.swift
//  Omos
//
//  Created by sangheon on 2022/05/31.
//

import Foundation

struct ListResponse: Codable {
    let isFollowed: Bool
    let nickname: String
    let profileURL: String?
    let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case isFollowed
        case nickname
        case profileURL = "profileUrl"
        case userID = "userId"
    }
}

struct FromIdRequest: Codable {
    let fromUserId: Int
}
