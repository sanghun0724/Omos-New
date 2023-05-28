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
    
    static let noError: Self = .init(title: "noError", messaage: "noError")
    static let loggedInError: Self = .init(title: "로그인 실패", messaage: "비밀번호 및 이메일을 확인 해주세요")
}

