//
//  LoginAPI.swift
//  Omos
//
//  Created by sangheon on 2022/02/17.
//

import Alamofire
import Foundation

class LoginAPI {
     func login(request: LoginRequest, completion:@escaping(Result<LoginResponse, Error>) -> Void) {
        AF.request(LoginTarget.login(request))
            .responseDecodable { (response: AFDataResponse<LoginResponse>) in
                switch response.result {
                case .success(let data):
                    print(data)
                    completion(.success(data))
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
    }

    static func doRefresh(request: RefreshRequest, completion:@escaping(Result<RefreshRespone, Error>) -> Void) {
        AF.request(LoginTarget.doRefresh(request)).responseDecodable { (response: AFDataResponse<RefreshRespone>) in
            switch response.result {
            case .success(let data):
                print(data)
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

     func signUp(request: SignUpRequest, completion:@escaping(Result<SignUpRespone, Error>) -> Void) {
        AF.request(LoginTarget.signUp(request)).responseDecodable { (response: AFDataResponse<SignUpRespone>) in
            switch response.result {
            case .success(let data):
                print(data)
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription) // 같은 닉네임
                completion(.failure(error))
            }
        }
    }

     func checkEmail(email: String, completion:@escaping(Result<CheckEmailRespone, Error>) -> Void) {
        let params: [String: Any] = [
            "email": email
        ]

        let url = URL(string: "http://ec2-3-37-146-80.ap-northeast-2.compute.amazonaws.com:8080/api/auth/check-email")!
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseDecodable(of: CheckEmailRespone.self) { response in
            switch response.result {
            case .success(let data):
                print("success data is coming")
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    static func SNSLogin(request: SNSLoginRequest, completion:@escaping(Result<SNSLoginResponse, Error>) -> Void) {
       AF.request(LoginTarget.SNSLogin(request)).responseDecodable { (response: AFDataResponse<SNSLoginResponse>) in
           switch response.result {
           case .success(let data):
               print(data)
               completion(.success(data))
           case .failure(let error):
               print(error.localizedDescription)
               completion(.failure(error))
           }
       }
   }

    func SNSSignUp(request: SNSSignUpRequest, completion:@escaping(Result<SNSSignUpResponse, Error>) -> Void) {
       AF.request(LoginTarget.SNSSignUp(request)).responseDecodable { (response: AFDataResponse<SNSSignUpResponse>) in
           switch response.result {
           case .success(let data):
               print(data)
               completion(.success(data))
           case .failure(let error):
               print(error.localizedDescription) // 같은 닉네임
               completion(.failure(error))
           }
       }
   }

    func emailCheck(request: EmailCheckRequest, completion:@escaping(Result<EmailCheckResponse, Error>) -> Void) {
       AF.request(LoginTarget.emailCheck(request)).responseDecodable { (response: AFDataResponse<EmailCheckResponse>) in
           switch response.result {
           case .success(let data):
               print(data)
               completion(.success(data))
           case .failure(let error):
               print(error.localizedDescription) // 같은 닉네임
               completion(.failure(error))
           }
       }
   }
}
