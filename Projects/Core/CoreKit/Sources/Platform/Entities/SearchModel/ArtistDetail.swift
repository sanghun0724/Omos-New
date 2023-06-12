//
//  ArtistDetail.swift
//  Omos
//
//  Created by sangheon on 2022/03/08.
//

import Foundation

struct ArtistRequest: Codable {
        let artistId: String
        let limit: Int
        let offset: Int
}

struct ArtistDetailRespone: Codable {
       let albumImageURL: String
       let artistName: [String]
       let musicID, musicTitle: String

       enum CodingKeys: String, CodingKey {
           case albumImageURL = "albumImageUrl"
           case artistName
           case musicID = "musicId"
           case musicTitle
       }
}
