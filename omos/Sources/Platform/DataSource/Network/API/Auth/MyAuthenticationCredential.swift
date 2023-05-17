//
//  MyAuthenticationCredential.swift
//  Omos
//
//  Created by sangheon on 2022/02/17.
//

import Alamofire
import Foundation

struct MyAuthenticationCredential: AuthenticationCredential {
    let accessToken: String
    let refreshToken: String
    let userID: Int

    // 유효시간 앞으로 5분이하 남았다고 하면 refresh가 필요하다고 true를 리턴
    var requiresRefresh = false
    // 자동으로 해주는듯?
}
