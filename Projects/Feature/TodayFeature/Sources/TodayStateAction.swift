//
//  TodayStateAction.swift
//  TodayFeature
//
//  Created by sangheon on 2023/06/18.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxSwift

// MARK: - TodayPresentableState

public struct TodayPresentableState {
    public init() {}
}

// MARK: - TodayPresentableAction

enum TodayPresentableAction {
    
}

// MARK: - TodayPresentableListener

protocol TodayPresentableListener: AnyObject {
    typealias Action = TodayPresentableAction
    typealias State = TodayPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}
