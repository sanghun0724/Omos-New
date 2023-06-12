//
//  MyRecord.swift
//  Omos
//
//  Created by sangheon on 2022/03/04.
//

import Foundation

// MARK: - MyRecordElement
struct MyRecordResponse: Codable {
    let category, createdDate: String
    let isPublic: Bool
    let music: Music
    let recordContents: String
    let recordID: Int
    let recordTitle: String
    
    enum CodingKeys: String, CodingKey {
        case category, createdDate, isPublic, music, recordContents
        case recordID = "recordId"
        case recordTitle
    }
}

// MARK: - MyRecord
struct SaveRequest: Codable { // add imageURL or image data using form - data
    let category: String
    let isPublic: Bool
    let musicID, recordContents, recordTitle: String
    let recordImageURL: String?
    let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case category, isPublic
        case musicID = "musicId"
        case recordContents
        case recordImageURL = "recordImageUrl"
        case recordTitle
        case userID = "userId"
    }
}

struct SaveRespone: Codable {
    let state: Bool
}

struct SaveParameter {
    let cate: String
    let content: String
    let isPublic: Bool
    let musicId: String
    let title: String
    let userid: Int
    let recordImageUrl: String
}

struct UpdateRequest: Codable {
    let contents: String
    let title: String
    let isPublic: Bool
    let recordImageUrl: String
}

struct PostRespone: Codable {
    let postId: Int
}

struct StateRespone: Codable {
    let state: Bool
}

struct DetailRecordResponse: Codable {
    let category, createdDate: String
    let isLiked, isScraped: Bool
    let isPublic: Bool?
    let likeCnt: Int
    let music: Music
    let nickname, recordContents: String
    let recordID: Int
    let recordImageURL: String?
    let recordTitle: String
    let scrapCnt, userID, viewsCnt: Int
    
    enum CodingKeys: String, CodingKey {
        case category, createdDate, isLiked, isPublic, isScraped, likeCnt, music, nickname, recordContents
        case recordID = "recordId"
        case recordImageURL = "recordImageUrl"
        case recordTitle, scrapCnt
        case userID = "userId"
        case viewsCnt
    }
}
