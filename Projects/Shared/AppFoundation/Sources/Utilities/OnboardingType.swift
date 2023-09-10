//
//  SignUpType.swift
//  AppFoundation
//
//  Created by 이상헌 on 2023/07/22.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

/// 회원가입 방식
public enum SignUpType {
   case kakao
   case apple
   case local
}

/// SNS 로그인 시 --> 로그인 인지, 회원가입인지
public enum AuthType {
    case login
    case signUp
}

