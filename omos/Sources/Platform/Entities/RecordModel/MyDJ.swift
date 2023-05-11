//
//  MyDJ.swift
//  Omos
//
//  Created by sangheon on 2022/03/13.
//

import Foundation

struct MyDjRequest: Codable {
    let postId: Int?
    let size: Int
}


struct MyDjProfileResponse: Codable {
    let count: Count
    let isFollowed: Bool?
    let profile: MyDjListResponse
}

// MARK: - Count
struct Count: Codable {
    let followerCount, followingCount, recordsCount: Int
}

// MARK: - Profile
struct MyDjListResponse: Codable {
    let nickname: String
    let profileURL: String?
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case nickname
        case profileURL = "profileUrl"
        case userID = "userId"
    }
}

struct UserRecordsResponse: Codable {
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

struct BlockRequest: Codable {
   let fromUserId: Int
   let toUserId: Int
}
