////
////  AwsS3Target.swift
////  Omos
////
////  Created by sangheon on 2022/04/07.
////
//
//import Alamofire
//import Foundation
//
//enum AwsS3Target {
//    case deleteImage(AwsDeleteImageRequest)
//}
//
//extension AwsS3Target: TargetType {
//    var baseURL: String {
//        "http://ec2-3-39-121-23.ap-northeast-2.compute.amazonaws.com:8080" + "/s3"
//    }
//
//    var method: HTTPMethod {
//        switch self {
//        case .deleteImage: return .delete
//        }
//    }
//
//    var path: String {
//        switch self {
//        case .deleteImage: return "/file"
//        }
//    }
//
//    var parameters: RequestParams? {
//        switch self {
//        case .deleteImage(let request): return .query(request)
//        }
//    }
//}
