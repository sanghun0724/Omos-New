//
//  Networking.swift
//  omos
//
//  Created by sangheon on 2023/05/17.
//

import Alamofire
import RxSwift

class Networking<Target: TargetType> {
    
    func request<D: Decodable>(
        _ target: Target,
        type: D.Type,
        file: String = #file,
        function: String = #function,
        line: UInt = #line
    ) -> Single<D> {
        #if DEBUG
        let requestString = "\(target.baseURL), \(target.method.rawValue) \(target.path)"
        let request = rxRequest(target, type: type)
            .do(onSuccess: { response in
                let message = "SUCCESS: \(requestString) (\(response))"
                Log.debug(message, file: file, function: function, line: line)
            }, onError: { error in
                let message = "FAILURE \(Self.logging(error: error))"
                Log.warning(message, file: file, function: function, line: line)
            }, onSubscribed: {
                let message = "REQUEST: \(requestString)"
                Log.debug(message, file: file, function: function, line: line)
            })
        return request
        #else
        return rxRequest(target, type: type)
        #endif
    }
    
    private func rxRequest<D: Decodable>(_ target: Target, type: D.Type) -> Single<D> {
        return Single.create { single in
            AF.request(target, interceptor: TokenInterceptor.shared.getInterceptor())
                .responseDecodable(of: type) { response in
                    switch response.result {
                    case .success(let data):
                        single(.success(data))
                    case .failure(let error):
                        single(.failure(error))
                    }
                }
            
            return Disposables.create()
        }
    }
    
    private static func logging(error: Error) -> String {
        let networkError = NetworkError(error: error)
        guard let afError = networkError.afError else { return error.localizedDescription }
        
        var messages = [String]()
        
        if !networkError.isAfUnderlyingError, let errorDescription = afError.errorDescription {
            messages.append("Alamofire Error Description: \(errorDescription)")
        }
        
        messages.append(networkError.afErrorDebugDescription().joined(separator: "\n"))
        messages.append(networkError.urlErrorDebugDescription().joined(separator: "\n"))
        
        return messages.joined(separator: "\n")
    }
}
