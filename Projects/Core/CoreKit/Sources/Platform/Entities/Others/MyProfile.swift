//
//  MyProfile.swift
//  Omos
//
//  Created by sangheon on 2022/03/20.
//

import Foundation

public struct PWUpdateRequest: Codable {
    let password: String
    let userId: Int
}

public struct MyProfileResponse: Codable {
   let nickname: String
   let profileUrl: String?
   let userId: Int
}

public struct ProfileUpdateRequest: Codable {
   let nickname: String
   let profileUrl: String?
   let userId: Int
}

public struct MyProfileRecordResponse: Codable {
    let likedRecords, scrappedRecords: [EdRecord]
}

// MARK: - EdRecord
public struct EdRecord: Codable {
    let recordID: Int
    let recordTitle: String
    let music: Music
    let recordImageURL: String?

    enum CodingKeys: String, CodingKey {
        case recordID = "recordId"
        case recordTitle, music
        case recordImageURL = "recordImageUrl"
    }
}
