//
//  ReactorValue.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

import Foundation

/*
 reactorkit 특성상 구독을 걸어 놓으면 errorResult 값이 바뀌지 않아도 다른 state 값이 바뀌면 그전 값도 같이 내려오게 된다.
 -> 이걸 막기 위해 생성 revision값 이용 -> distantUntilChange() 
 */
struct ReactorValue<T>: Equatable {
    var revision : Int = 0
    var value : T?
    
    static func == (lhs: ReactorValue<T>, rhs: ReactorValue<T>) -> Bool {
        lhs.revision == rhs.revision
    }
}
