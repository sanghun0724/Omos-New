//
//  LoginRequest.swift
//  Omos
//
//  Created by sangheon on 2022/02/17.
//

import Foundation

/// Local Login
struct LoginRequest: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let userId: Int
    let accessToken: String
    let refreshToken: String
}

/// SNS Login (KAKAO,APPLE)
struct SNSLoginRequest: Codable {
    let email: String
    let type: SNSType
}

enum SNSType: String, Codable {
    case KAKAO
    case APPLE
}

struct SNSLoginResponse: Codable {
    let userId: Int
    let accessToken: String
    let refreshToken: String
}
