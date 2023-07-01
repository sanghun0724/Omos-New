//
//  ReactorValue.swift
//  AppFoundation
//
//  Created by 이상헌 on 2023/07/01.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

/*
 reactorkit 특성상 구독을 걸어 놓으면 errorResult 값이 바뀌지 않아도 다른 state 값이 바뀌면 그전 값도 같이 내려오게 된다.
 -> 이걸 막기 위해 생성 revision값 이용 -> distantUntilChange()
 */
public struct ReactorValue<T>: Equatable {
    public var revision : Int = 0
    public var value : T?
    
    public init(revision: Int = 0, value: T? = nil) {
        self.revision = revision
        self.value = value
    }
    
    public static func == (lhs: ReactorValue<T>, rhs: ReactorValue<T>) -> Bool {
        lhs.revision == rhs.revision
    }
}
