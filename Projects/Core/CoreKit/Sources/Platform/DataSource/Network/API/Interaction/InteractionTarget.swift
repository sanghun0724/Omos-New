//
//  InteractionTarget.swift
//  Omos
//
//  Created by sangheon on 2022/03/11.
//

import Alamofire
import Foundation

enum InteractionTarget {
    case saveScrap(postId: Int, userId: Int)
    case deleteScrap(postId: Int, userId: Int)
    case saveLike(postId: Int, userId: Int)
    case deleteLike(postId: Int, userId: Int)
    case block(type: String, BlockRequest)
}

extension InteractionTarget: TargetType {
    var baseURL: String {
       // RestApiUrl.restUrl
        ""
    }

    var method: HTTPMethod {
        switch self {
        case .saveScrap: return .post
        case .deleteScrap: return .delete
        case .saveLike: return .post
        case .deleteLike: return .delete
        case .block: return .post
        }
    }

    var path: String {
        switch self {
        case let .saveScrap(post, user): return "scrap/save/\(post)/\(user)"
        case let .deleteScrap(post, user): return "scrap/delete/\(post)/\(user)"
        case let .saveLike(post, user): return "like/save/\(post)/\(user)"
        case let .deleteLike(post, user): return "like/delete/\(post)/\(user)"
        case let .block(type, _): return "/block/save/\(type)"
        }
    }

    var parameters: RequestParams? {
        switch self {
        case .block( _, let request): return .body(request)
        default:
            return nil
        }
    }
}
