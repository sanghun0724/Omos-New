//
//  BlockTarget.swift
//  Omos
//
//  Created by sangheon on 2022/05/31.
//

import Alamofire

enum BlockTarget {
    case blockList(userId: Int)
    case blockDelete(fromId:Int, toId:Int)
    case block(type: String, BlockRequest)
}

extension BlockTarget: TargetType {
    var baseURL: String {
       // RestApiUrl.restUrl + "/block"
        ""
    }

    var method: HTTPMethod {
        switch self {
        case .blockDelete: return .delete
        case .blockList: return .get
        case .block: return .post
        }
    }

    var path: String {
        switch self {
        case let .blockDelete(fromId,toId): return "/delete/\(fromId)/\(toId)"
        case let .blockList(user): return "/select/\(user)"
        case let .block(type, _): return "/save/\(type)"
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
