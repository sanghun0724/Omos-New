//
//  NetworkRepository.swift
//  omos
//
//  Created by sangheon on 2023/05/17.
//

import Alamofire

class NetworkRepository<Service: TargetType> {
    let provider: Networking<Service>
    
    init(networkingProvider: Networking<Service>) {
        self.provider = networkingProvider
    }
}


