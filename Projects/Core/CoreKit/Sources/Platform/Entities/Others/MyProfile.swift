//
//  MyProfile.swift
//  Omos
//
//  Created by sangheon on 2022/03/20.
//

import Foundation

struct PWUpdateRequest: Codable {
    let password: String
    let userId: Int
}

struct MyProfileResponse: Codable {
   let nickname: String
   let profileUrl: String?
   let userId: Int
}

struct ProfileUpdateRequest: Codable {
   let nickname: String
   let profileUrl: String?
   let userId: Int
}

struct MyProfileRecordResponse: Codable {
    let likedRecords, scrappedRecords: [EdRecord]
}

// MARK: - EdRecord
struct EdRecord: Codable {
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
