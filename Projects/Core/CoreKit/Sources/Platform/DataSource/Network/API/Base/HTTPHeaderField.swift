//
//  HTTPHeaderField.swift
//  Omos
//
//  Created by sangheon on 2022/02/17.
//

import Alamofire
import Foundation

enum HTTPHeaderField: String {
    case authentication = "Autorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

enum ContentType: String {
    case json = "Application/json"
}

class TokenInterceptor {
   static let shared = TokenInterceptor()

    private init() {}

    func getInterceptor() -> AuthenticationInterceptor<MyAuthenticator> {
        //  AuthenticationInterceptor 적용
        let authenticator = MyAuthenticator()
        let credential = MyAuthenticationCredential(accessToken: UserDefaults.standard.string(forKey: "access") ?? "", refreshToken: UserDefaults.standard.string(forKey: "refresh") ?? "", userID: UserDefaults.standard.integer(forKey: "user"))
        let myAuthencitationInterceptor = AuthenticationInterceptor(authenticator: authenticator,
                                                                    credential: credential)
        return myAuthencitationInterceptor
    }
}
