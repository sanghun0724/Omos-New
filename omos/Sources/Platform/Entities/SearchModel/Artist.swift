//
//  Artist.swift
//  Omos
//
//  Created by sangheon on 2022/03/06.
//

import Foundation

struct ArtistRespone: Codable {
    let artistName, artistID: String
    let artistImageURL: String?
    let genres: [String]

    enum CodingKeys: String, CodingKey {
        case artistName
        case artistID = "artistId"
        case artistImageURL = "artistImageUrl"
        case genres
    }
}
