//
//  Album.swift
//  Omos
//
//  Created by sangheon on 2022/03/06.
//

import Foundation

// shared
struct MusicRequest: Codable {
    let keyword: String
    let limit: Int
    let offset: Int
    let type: Int?
}

/// album
struct AlbumRespone: Codable {
    let albumID, albumImageURL, albumTitle: String
    let artists: [Artist]
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case albumImageURL = "albumImageUrl"
        case albumTitle, artists, releaseDate
    }
}
