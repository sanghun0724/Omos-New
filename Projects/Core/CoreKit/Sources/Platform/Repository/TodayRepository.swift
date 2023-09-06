//
//  TodayRepository.swift
//  CoreKit
//
//  Created by 이상헌 on 2023/09/05.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxSwift

public protocol TodayRepository {
    /// 인기 있는 레코드
    func requestPopularRecord() -> Single<[PopuralResponse]>
    /// Today Track
    func requestTodayTrackRecord() -> Single<TodayTrackResponse>
    /// 추천 DJ
    func requestRecommendDJ() -> Single<[DJResponse]>
    /// 내가 사랑하는 Record
    func requestLovedRecord(id userID: Int) -> Single<LovedResponse>
}

public final class TodayRepositoryImpl: NetworkRepository<TodayTarget>, TodayRepository {
    
    // MARK: - API Request
    
    public func requestPopularRecord() -> RxSwift.Single<[PopuralResponse]> {
        provider.request(.popuralRecord, type: [PopuralResponse].self)
    }
    
    public func requestTodayTrackRecord() -> RxSwift.Single<TodayTrackResponse> {
        provider.request(.todayRecord, type: TodayTrackResponse.self)
    }
    
    public func requestRecommendDJ() -> RxSwift.Single<[DJResponse]> {
        provider.request(.recommendDJRecord, type: [DJResponse].self)
    }
    
    public func requestLovedRecord(id userID: Int) -> RxSwift.Single<LovedResponse> { 
        provider.request(.lovedRecord(userId: userID), type: LovedResponse.self)
    }
    
}
