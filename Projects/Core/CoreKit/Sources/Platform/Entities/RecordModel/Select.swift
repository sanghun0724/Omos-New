//
//  Select.swift
//  Omos
//
//  Created by sangheon on 2022/03/02.
//

import Foundation

struct SelectResponse: Codable {
    var aLine: [ALine]
    var ost: [ALine]
    var lyrics: [ALine]
    var free: [ALine]
    var story: [ALine]
    
    enum CodingKeys: String, CodingKey {
        case aLine = "A_LINE"
        case ost = "OST"
        case lyrics = "LYRICS"
        case free = "FREE"
        case story = "STORY"
    }
}

// MARK: - ALine
struct ALine: Codable {
    let music: Music
    let nickname: String
    let recordID: Int
    let recordImageURL: String?
    let recordTitle: String
    let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case music, nickname
        case recordID = "recordId"
        case recordImageURL = "recordImageUrl"
        case recordTitle
        case userID = "userId"
    }
}

// MARK: - Music
struct Music: Codable {
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

// MARK: - Artist
struct Artist: Codable {
    let artistID, artistName: String
    
    enum CodingKeys: String, CodingKey {
        case artistID = "artistId"
        case artistName
    }
}
