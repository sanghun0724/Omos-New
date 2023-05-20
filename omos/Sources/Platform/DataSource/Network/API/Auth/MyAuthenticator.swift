//
//  MyAuthenticator.swift
//  Omos
//
//  Created by sangheon on 2022/02/17.
//

import Alamofire
import Foundation

class MyAuthenticator: Authenticator {
    typealias Credential = MyAuthenticationCredential

    func apply(_ credential: Credential, to urlRequest: inout URLRequest) {
        urlRequest.headers.add(.authorization(bearerToken: credential.accessToken))
        urlRequest.addValue(credential.refreshToken, forHTTPHeaderField: "refresh-token")
    }

    func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        response.statusCode == 401
    }

    func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: Credential) -> Bool {
        // bearerToken의 urlRequest에 대해서만 refresh를 시도 (true)
        let bearerToken = HTTPHeader.authorization(bearerToken: credential.accessToken).value
        return urlRequest.headers["Authorization"] == bearerToken
    }

    func refresh(_ credential: Credential, for session: Session, completion: @escaping (Result<MyAuthenticationCredential, Error>) -> Void) {
        print("refresh token here@@")
        let requeust = RefreshRequest(accessToken: UserDefaults.standard.string(forKey: "access") ?? "", refreshToken: UserDefaults.standard.string(forKey: "refresh") ?? "", userId: UserDefaults.standard.integer(forKey: "user") )
//        LoginAPI.doRefresh(request: requeust) { response in
//            switch response {
//            case .success(let data):
//                print("is successssss")
//                print(data)
//                let accessToken = data.accessToken
//                let refreshToken = data.refreshToken
//                let userId = data.userId
//                UserDefaults.standard.set(accessToken, forKey: "access")
//                UserDefaults.standard.set(refreshToken, forKey: "refresh")
//                UserDefaults.standard.set(userId, forKey: "user")
//               // Account.currentUser = UserDefaults.standard.integer(forKey: "user")
//                let newCredential = MyAuthenticationCredential(accessToken: accessToken, refreshToken: refreshToken, userID: userId)
//                completion(.success(newCredential))
//            case .failure(let error):
//                completion(.failure(error))
//                print("기존의 가지고 있던 토큰정보가 잘못되었음")
//            }
//        }
    }
}
