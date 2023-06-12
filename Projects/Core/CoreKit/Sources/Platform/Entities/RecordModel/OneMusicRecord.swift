//
//  OneMusicRecord.swift
//  Omos
//
//  Created by sangheon on 2022/03/10.
//

import Foundation

struct OneMusicRecordRequest: Codable {
    let postId: Int?
    let size: Int
    let userId: Int
    let sortType: String
}
