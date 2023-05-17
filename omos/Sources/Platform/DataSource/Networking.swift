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
        responseType: D.Type
    ) -> Single<D> {
            
        return .never()
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
    
}
