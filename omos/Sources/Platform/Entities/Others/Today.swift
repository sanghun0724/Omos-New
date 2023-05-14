//
//  Today.swift
//  Omos
//
//  Created by sangheon on 2022/03/15.
//

import Foundation

struct PopuralResponse: Codable {
    let music: Music
    let nickname: String
    let recordID: Int
    let recordImageURL, recordTitle: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case music, nickname
        case recordID = "recordId"
        case recordImageURL = "recordImageUrl"
        case recordTitle
        case userID = "userId"
    }
}

struct LovedResponse: Codable {
    let recordID: Int
    let music: Music
    let recordImageURL: String?

    enum CodingKeys: String, CodingKey {
        case recordID = "recordId"
        case music
        case recordImageURL = "recordImageUrl"
    }
}

struct TodayTrackResponse: Codable {
    let albumImageURL, albumTitle: String
    let artists: [Artist]
    let musicID, musicTitle: String

    enum CodingKeys: String, CodingKey {
        case albumImageURL = "albumImageUrl"
        case albumTitle, artists
        case musicID = "musicId"
        case musicTitle
    }
}

struct RecommendDjResponse: Codable {
    let nickname: String
    let profileURL: String?
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case nickname
        case profileURL = "profileUrl"
        case userID = "userId"
    }
}
