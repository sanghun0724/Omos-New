//
//  HasErrorState.swift
//  omos
//
//  Created by sangheon on 2023/05/27.
//

import ReactorKit
import RxSwift

import AppFoundation

// MARK: - HasErrorState

public protocol HasErrorState {
    var myError: ReactorValue<MyError> { get }
}

// MARK: - HasErrorStream

public protocol HasErrorStream {
    var myErrorStream: Observable<ReactorValue<MyError>> { get }
}

public extension HasErrorStream where Self: Reactor, Self.State: HasErrorState {
    var myErrorStream: Observable<ReactorValue<MyError>> {
        state.map(\.myError)
    }
}

public extension HasErrorStream where Self: HasViewModel, Self.ViewModel: HasErrorState {
    var myErrorStream: Observable<ReactorValue<MyError>> {
        viewModel.map(\.myError)
    }
}
