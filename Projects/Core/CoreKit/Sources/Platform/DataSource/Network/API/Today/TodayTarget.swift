//
//  TodayTarget.swift
//  Omos
//
//  Created by sangheon on 2022/03/15.
//

import Alamofire
import Foundation

enum TodayTarget {
  case popuralRecord
  case lovedRecord(userId: Int)
  case recommendDJRecord
  case todayRecord
}

extension TodayTarget: TargetType {
    var baseURL: String {
      // RestApiUrl.restUrl + "/today"
        ""
    }

    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    var path: String {
        switch self {
        case .popuralRecord: return "/famous-records-of-today"
        case .lovedRecord(let id): return "/music-loved/\(id)"
        case .recommendDJRecord: return "/recommend-dj"
        case .todayRecord: return "/music-of-today"
        }
    }

    var parameters: RequestParams? {
        switch self {
        default:
            return nil
        }
    }
}
