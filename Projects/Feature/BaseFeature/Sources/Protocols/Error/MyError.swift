//
//  MyError.swift
//  omos
//
//  Created by sangheon on 2023/05/27.
//

import Foundation

public struct MyError: Error, Equatable {
    public let title: String
    public let messaage: String
    
    public static let defaultError: Self = .init(title: "에러 발생", messaage: "제보 및 문의 부탁드립니다")
    public static let noError: Self = .init(title: "noError", messaage: "noError")
    public static let loggedInError: Self = .init(title: "로그인 실패", messaage: "비밀번호 및 이메일을 확인 해주세요")
    public static let duplicationError: Self = .init(title: "중복된 이메일입니다.", messaage: "다시 확인해주세요.")
    public static let invalidInputCode: Self = .init(title: "잘못된 인증코드 입니다", messaage: "다시 확인해주세요.")
    public static let duplicatedNicknameError: Self = .init(title: "중복된 닉네임 입니다.", messaage: "다시 확인해주세요.")
}

