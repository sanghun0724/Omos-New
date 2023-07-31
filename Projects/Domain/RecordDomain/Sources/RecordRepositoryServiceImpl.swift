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

// MARK: - RecordRepositoryServiceImpl

public final class RecordRepositoryServiceImpl: RecordRepositoryService {
    private let recordRepository: RecordRepository
    private let recordTranslator: RecordTranslator
    
    public init(
        recordRepository: RecordRepository,
        recordTranslator: RecordTranslator
    ) {
        self.recordRepository = recordRepository
        self.recordTranslator = recordTranslator
    }
    
    public func requestMyRecords(userId: Int) -> Observable<Void> {
        recordRepository.requestMyRecord(request: .init(userId: userId))
            .asObservable()
            .map(MyRecordModel.init(myRecordResponse:))
        
        return .empty()
    }
    
    func update() {}
    
    func remove() {}
    
    func create() {}
    
}


