//
//  Category.swift
//  Omos
//
//  Created by sangheon on 2022/03/03.
//

import Foundation

// MARK: CategoryRespone

struct RecordResponse: Codable {
    let music: Music
    let recordID: Int
    let recordTitle, recordContents: String
    let recordImageURL: String?
    let createdDate, category: String
    let viewsCnt, userID: Int
    let nickname: String
    let likeCnt, scrapCnt: Int
    let isLiked, isScraped: Bool

    enum CodingKeys: String, CodingKey {
        case music
        case recordID = "recordId"
        case recordTitle, recordContents
        case recordImageURL = "recordImageUrl"
        case createdDate, category, viewsCnt
        case userID = "userId"
        case nickname, likeCnt, scrapCnt, isLiked, isScraped
    }
}

enum CateType: String, Codable {
    case aLine = "A_LINE"
    case ost = "OST"
    case story = "STORY"
    case lyrics = "LYRICS"
    case free = "FREE"
    // 정렬
    case asc = "ASC"
    case desc = "DESC"
}

struct CateRequest: Codable {
    let postId: Int?
    let size: Int
    let sortType: String
    let userid: Int
}
