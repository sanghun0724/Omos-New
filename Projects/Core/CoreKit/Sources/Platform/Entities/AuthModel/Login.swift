//
//  LoginRequest.swift
//  Omos
//
//  Created by sangheon on 2022/02/17.
//

import Foundation

/// Local Login
public struct LoginRequest: Codable {
    public let email: String
    public let password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

public struct LoginResponse: Codable {
    public let userId: Int
    public let accessToken: String
    public let refreshToken: String
    
    public init(userId: Int, accessToken: String, refreshToken: String) {
        self.userId = userId
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}

/// SNS Login (KAKAO,APPLE)
public struct SNSLoginRequest: Codable {
    public let email: String
    public let type: SNSType
    
    public init(email: String, type: SNSType) {
        self.email = email
        self.type = type
    }
}

public enum SNSType: String, Codable {
    case KAKAO
    case APPLE
}

public struct SNSLoginResponse: Codable {
    public let userId: Int
    public let accessToken: String
    public let refreshToken: String
    
    public init(userId: Int, accessToken: String, refreshToken: String) {
        self.userId = userId
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
