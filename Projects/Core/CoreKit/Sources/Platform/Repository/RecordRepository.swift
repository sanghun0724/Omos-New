//
//  RecordRepository.swift
//  CoreKit
//
//  Created by 이상헌 on 2023/06/24.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxSwift

// MARK: - RecordRepository

public protocol RecordRepository {
    /// 카테고리별 레코드
    func categorizedRecords(reqeust: CategorizedRecordsRequest) -> Single<RecordResponse>
}

// MARK: - RecordRepositoryImpl

public final class RecordRepositoryImpl: NetworkRepository<RecordTarget>, RecordRepository {
    
    // MARK: - API Request
   
    public func categorizedRecords(reqeust: CategorizedRecordsRequest) -> Single<RecordResponse> {
        .never()
    }
    
}
