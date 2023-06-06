//
//  MyError.swift
//  omos
//
//  Created by sangheon on 2023/05/27.
//

import Foundation

struct MyError: Error, Equatable {
    let title: String
    let messaage: String
    
    static let defaultError: Self = .init(title: "에러 발생", messaage: "제보 및 문의 부탁드립니다")
    static let noError: Self = .init(title: "noError", messaage: "noError")
    static let loggedInError: Self = .init(title: "로그인 실패", messaage: "비밀번호 및 이메일을 확인 해주세요")
    static let duplicationError: Self = .init(title: "중복된 이메일입니다.", messaage: "다시 확인해주세요.")
    static let invalidInputCode: Self = .init(title: "잘못된 인증코드 입니다", messaage: "다시 확인해주세요.")
}

