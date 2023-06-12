//
//  SessionManagerProtocol.swift
//  Omos
//
//  Created by sangheon on 2022/06/02.
//

import Alamofire

protocol SessionProtocol: AnyObject {
    @discardableResult
    func request(_ convertible: URLRequestConvertible, interceptor: RequestInterceptor?) -> DataRequest
}

extension Session:SessionProtocol {}
