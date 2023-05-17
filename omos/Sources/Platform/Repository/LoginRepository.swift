//
//  LoginRepository.swift
//  omos
//
//  Created by sangheon on 2023/05/17.
//

import Foundation

import RxSwift

// MARK: - LoginRepository

protocol LoginRepository {
    func login(request: LoginRequest)
}


final class LoginRepositoryImpl: NetworkRepository<LoginTarget>, LoginRepository {
    
    // MARK: Properties
    
    func login(request: LoginRequest) -> Single<LoginResponse>{
        provider.request()
           
    }
    
    
}
