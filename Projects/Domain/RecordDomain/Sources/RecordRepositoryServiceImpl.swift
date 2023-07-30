//
//  RecordRepositoryService.swift
//  RecordDomain
//
//  Created by 이상헌 on 2023/06/24.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

import RxRelay
import RxSwift

import AppFoundation
import CoreKit
import RecordDomainInterface

public class RecordRepositoryServiceImpl: RecordRepositoryService {
    private let recordRepository : RecordRepository
    
    public init(
        recordRepository: RecordRepository
    ) {
        self.recordRepository = recordRepository
    }
    
    func requestMyRecords(userID: Int) -> Observable<Bool> {
        // we can make user info as singletone
        let _ = recordRepository.requestMyRecord(request: UserIDRequest(userId: 22))
            .asObservable()
            
        return .empty()
    }
}

