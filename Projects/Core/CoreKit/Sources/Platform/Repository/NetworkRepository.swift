//
//  NetworkRepository.swift
//  omos
//
//  Created by sangheon on 2023/05/17.
//

import Alamofire

public class NetworkRepository<Service: TargetType> {
    let provider: Networking<Service>
    
    public init(networkingProvider: Networking<Service>) {
        self.provider = networkingProvider
    }
}


