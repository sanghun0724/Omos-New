//
//  SignUp.swift
//  Omos
//
//  Created by sangheon on 2022/02/18.
//

import Foundation

public struct SignUpRequest: Codable {
    public let email: String
    public let nickname: String
    public let password: String
    
    public init(email: String, nickname: String, password: String) {
        self.email = email
        self.nickname = nickname
        self.password = password
    }
}

public struct SignUpResponse: Codable {
    public let state: Bool
}

public struct CheckEmailRequest: Codable {
    public let email: String
    
    public init(email: String) {
        self.email = email
    }
}

public struct CheckEmailResponse: Codable {
    public let state: Bool
}

public struct SNSSignUpRequest: Codable {
    public let email: String
    public let nickname: String
    public let type: SNSType
    
    public init(email: String, nickname: String, type: SNSType) {
        self.email = email
        self.nickname = nickname
        self.type = type
    }
}

public struct SNSSignUpResponse: Codable {
    public let userId: Int
    public let accessToken: String
    public let refreshToken: String
}

public struct EmailValidationRequest: Codable {
    public let email: String
    
    public init(email: String) {
        self.email = email
    }
}

public struct EmailValidationResponse: Codable {
    public let code: String
}
