//
//  MyDJ.swift
//  Omos
//
//  Created by sangheon on 2022/03/13.
//

import Foundation

public struct MyDjRequest: Codable {
    let postId: Int?
    let size: Int
}

public struct MyDjProfileResponse: Codable {
    let count: Count
    let isFollowed: Bool?
    let profile: DJResponse
}

// MARK: - Count
public struct Count: Codable {
    let followerCount, followingCount, recordsCount: Int
}

public struct UserRecordsResponse: Codable {
       let music: Music
       let recordID: Int
       let recordTitle, recordContents: String
       let recordImageURL: String?
       let createdDate, category: String
       let viewsCnt, userID: Int
       let nickname: String
       let likeCnt, scrapCnt: Int
       let isLiked, isScraped: Bool

    public enum CodingKeys: String, CodingKey {
           case music
           case recordID = "recordId"
           case recordTitle, recordContents
           case recordImageURL = "recordImageUrl"
           case createdDate, category, viewsCnt
           case userID = "userId"
           case nickname, likeCnt, scrapCnt, isLiked, isScraped
       }
}

public struct BlockRequest: Codable {
   let fromUserId: Int
   let toUserId: Int
}
