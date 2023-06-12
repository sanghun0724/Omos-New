//
//  MyRequestInterceptor.swift
//  Omos
//
//  Created by sangheon on 2022/02/17.
//

import Alamofire
import Foundation

final class MyRequestInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard let accessToken = UserDefaults.standard.value(forKey: "accessToken") else {
            // 로컬에 엑세스토큰이 있는경우에만 붙여서 보내주기
            completion(.success(urlRequest))
            return
        }
        let token = accessToken as? String ?? ""
        var urlRequest = urlRequest
        urlRequest.setValue("Bearer" + token, forHTTPHeaderField: "Authorization")
        completion(.success(urlRequest))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }

        /* 여기서 리프레쉬 받아오면 되유
        RefreshTokenAPI.refreshToken { result in
            switch result {
            case .success(let accessToken):
                KeychainServiceImpl.shared.accessToken = accessToken
                completion(.retry)
            case .failure(let error):
                completion(.doNotRetryWithError(error))
            }
        }
        */
    }
}
