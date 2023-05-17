//
//  RecordTarget.swift
//  Omos
//
//  Created by sangheon on 2022/03/02.
//

import Alamofire
import Foundation

enum RecordTarget {
    case select
    case category(cate: CateType, request: CateRequest)
    case recordDetail(postId: Int, userId: Int)
    case myRecord(userid: Int)
    case save(SaveRequest)
    case recordIspublic(postId: Int)
    case recordDelete(postId: Int)
    case recordUpdate(postId: Int, UpdateRequest)
    case oneMusicRecord(musicId: String, OneMusicRecordRequest)
    case myDjAllRecord(userId: Int, MyDjRequest)
    case userRecords(fromId: Int, toId: Int)
    // Profile like&scrap
    case likeRecords(userId: Int)
    case scrapRecords(userId: Int)
    case myProfileRecords(userId: Int)
    case reportRecord(postId: Int)
}

extension RecordTarget: TargetType {
    var baseURL: String {
       // RestApiUrl.restUrl + "/records"
        ""
    }

    var method: HTTPMethod {
        switch self {
        case .select: return .get
        case .recordDetail: return .get
        case .category: return .get
        case .myRecord: return .get
        case .save: return .post
        case .recordIspublic: return .put
        case .recordDelete: return .delete
        case .recordUpdate: return .put
        case .oneMusicRecord: return .get
        case .myDjAllRecord: return .get
        case .userRecords: return .get
        case .likeRecords: return .get
        case .scrapRecords: return .get
        case .myProfileRecords: return .get
        case .reportRecord: return .put
        }
    }

    var path: String {
        switch self {
        case .select: return "" // "/select/\("Account.currentUser")" // TODO: 처리 
        case let .recordDetail(post, user): return "/select/\(post)/user/\(user)"
        case .category(let cate, _): return "/select/category/\(cate.rawValue)"
        case .myRecord(let user): return "/\(user)"
        case .save: return "/save"
        case .recordIspublic(let id): return "/\(id)/ispublic"
        case .recordDelete(let id): return "/delete/\(id)"
        case .recordUpdate(let id, _): return "/update/\(id)"
        case .oneMusicRecord(let id, _): return "/select/music/\(id)"
        case .myDjAllRecord(let user, _): return "/select/\(user)/my-dj"
        case let .userRecords(from, to): return "/select/user/\(from)/\(to)"
        case .likeRecords(let user): return "/select/\(user)/liked-records"
        case .scrapRecords(let user): return "/select/\(user)/scrapped-records"
        case .myProfileRecords(let user): return "select/\(user)/my-records"
        case .reportRecord(let post): return "/\(post)/report"
        }
    }

    var parameters: RequestParams? {
        switch self {
        case .category(_, let request): return .query(request)
        case .save(let request): return .body(request)
        case .recordUpdate(_, let request): return .body(request)
        case .oneMusicRecord(_, let request): return .query(request)
        case .myDjAllRecord(_, let request): return .query(request)
        default:
            return nil
        }
    }
}
