//
//  TodayRepositoryServiceImpl.swift
//  TodayDomain
//
//  Created by 이상헌 on 2023/09/05.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

import RxRelay
import RxSwift

import AppFoundation
import CoreKit
import TodayDomainInterface

public final class TodayRepositoryServiceImpl: TodayRepositoryService {
    
    private let todayRepository: TodayRepository
    
    
    public init(
        todayRepository: TodayRepository,
        
    ) {
        self.todayRepository = todayRepository
    }
    
    public func loadData() -> Observable<Void> {
    
        
        
        return .empty()
    }
    
}
