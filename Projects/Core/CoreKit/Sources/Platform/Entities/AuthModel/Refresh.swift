//
//  Refresh.swift
//  Omos
//
//  Created by sangheon on 2022/02/18.
//

import Foundation

public struct RefreshRequest: Codable {
    public let accessToken: String
    public let refreshToken: String
    public let userId: Int
}

public struct RefreshRespone: Codable {
    public let accessToken: String
    public let refreshToken: String
    public let userId: Int
}
