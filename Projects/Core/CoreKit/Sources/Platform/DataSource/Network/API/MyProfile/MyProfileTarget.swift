//
//  MyProfileTarget.swift
//  Omos
//
//  Created by sangheon on 2022/03/20.
//

import Alamofire
import Foundation

enum MyProfileTarget {
    case myProfile(userId: Int)
    case updateProfile(ProfileUpdateRequest)
    case userReport(userId: Int)
}

extension MyProfileTarget: TargetType {
    var baseURL: String {
        RestApiUrl.restUrl + "/user"
    }
    
    var method: HTTPMethod {
        switch self {
        case .myProfile: return .get
        case .updateProfile: return .put
        case .userReport: return .put
        }
    }
    var path: String {
        switch self {
        case .myProfile(let user): return "/\(user)"
        case .updateProfile: return "/update/profile"
        case .userReport(let user): return "/\(user)/report"
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .updateProfile(let request): return .body(request)
        default:
            return nil
        }
    }
}
