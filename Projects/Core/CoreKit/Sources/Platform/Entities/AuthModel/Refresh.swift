//
//  Refresh.swift
//  Omos
//
//  Created by sangheon on 2022/02/18.
//

import Foundation

struct RefreshRequest: Codable {
    let accessToken: String
    let refreshToken: String
    let userId: Int
}

struct RefreshRespone: Codable {
    let accessToken: String
    let refreshToken: String
    let userId: Int
}
