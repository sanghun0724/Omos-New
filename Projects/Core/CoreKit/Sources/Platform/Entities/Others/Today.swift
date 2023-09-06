//
//  Today.swift
//  Omos
//
//  Created by sangheon on 2022/03/15.
//

import Foundation

public struct PopuralResponse: Codable {
    public let music: Music
    public let nickname: String
    public let recordID: Int
    public let recordImageURL, recordTitle: String
    public let userID: Int

    enum CodingKeys: String, CodingKey {
        case music, nickname
        case recordID = "recordId"
        case recordImageURL = "recordImageUrl"
        case recordTitle
        case userID = "userId"
    }
}

public struct LovedResponse: Codable {
    public let recordID: Int
    public let music: Music
    public let recordImageURL: String?

    enum CodingKeys: String, CodingKey {
        case recordID = "recordId"
        case music
        case recordImageURL = "recordImageUrl"
    }
}

public struct TodayTrackResponse: Codable {
    public let albumImageURL, albumTitle: String
    public let artists: [Artist]
    public let musicID, musicTitle: String

    enum CodingKeys: String, CodingKey {
        case albumImageURL = "albumImageUrl"
        case albumTitle, artists
        case musicID = "musicId"
        case musicTitle
    }
}
