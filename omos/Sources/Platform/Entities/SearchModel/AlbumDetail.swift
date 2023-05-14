//
//  AlbumDetail.swift
//  Omos
//
//  Created by sangheon on 2022/03/08.
//

import Foundation

struct AlbumDetailRespone: Codable {
    let artists: [Artist]
    let musicID, musicTitle: String

    enum CodingKeys: String, CodingKey {
        case artists
        case musicID = "musicId"
        case musicTitle
    }
}
