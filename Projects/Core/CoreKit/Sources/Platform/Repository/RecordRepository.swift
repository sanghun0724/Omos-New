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
    func requestCategorizedRecords(request: CategorizedRecordsRequest) -> Single<RecordResponse>
    /// 마이 레코드
    func requestMyRecord(request: UserIDRequest) -> Single<MyRecordResponse>
}

// MARK: - RecordRepositoryImpl

public final class RecordRepositoryImpl: NetworkRepository<RecordTarget>, RecordRepository {
    
    // MARK: - API Request
    
    public func requestCategorizedRecords(request: CategorizedRecordsRequest) -> Single<RecordResponse> {
        provider.request(.category(request: request), type: RecordResponse.self)
    }
    
    public func requestMyRecord(request: UserIDRequest) -> Single<MyRecordResponse> {
        provider.request(.myRecord(userid: request.userId), type: MyRecordResponse.self)
    }
}
