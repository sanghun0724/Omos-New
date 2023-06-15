//
//  LoginTarget.swift
//  Omos
//
//  Created by sangheon on 2022/02/17.
//

import Alamofire

enum LoginTarget {
    case login(LoginRequest)
    case getUserDetails(UserDetailRequest)
    // case kakaoLogin()
    case checkEmail(CheckEmailRequest)
    case signUp(SignUpRequest)
    case doRefresh(RefreshRequest)
    case SNSLogin(SNSLoginRequest)
    case SNSSignUp(SNSSignUpRequest)
    case logOut(userId: Int)
    case signout(userId: Int)
    case emailValidation(EmailValidationRequest)
    case updatePassword(PWUpdateRequest)
}

extension LoginTarget: TargetType {
    var baseURL: String {
       //  RestApiUrl.restUrl + "/auth"
        ""
    }

    var method: HTTPMethod {
        switch self {
        case .login: return .post
        case .getUserDetails: return .get
        case .signUp: return .post
        case .doRefresh: return .post
        case .checkEmail: return .get
        case .SNSLogin: return .post
        case .SNSSignUp: return .post
        case .logOut: return .delete
        case .signout: return .delete
        case .emailValidation: return .post
        case .updatePassword: return .put
        }
    }

    var path: String {
        switch self {
        case .login: return "/login"
        case .getUserDetails: return "/details" // it could be changed
        case .signUp: return "/signup"
        case .doRefresh: return "/post"
        case .checkEmail: return "/check-email"
        case .SNSLogin: return "/sns-login"
        case .SNSSignUp: return "/sns-signup"
        case .logOut(let user): return "/logout/\(user)"
        case .signout(let user): return "/signout/\(user)"
        case .emailValidation: return "/email"
        case .updatePassword: return "/update/password"
        }
    }

    var parameters: RequestParams? {
        switch self {
        case .login(let request): return .body(request)
        case .getUserDetails(let request): return .body(request)
        case .signUp(let request): return .body(request)
        case .doRefresh(let request): return .body(request)
        case .checkEmail(let request): return .query(request)
        case .SNSLogin(let request): return .body(request)
        case .SNSSignUp(let request): return .body(request)
        case .emailValidation(let request): return .body(request)
        case .updatePassword(let request): return .body(request)
        default:
            return nil
        }
    }
}
