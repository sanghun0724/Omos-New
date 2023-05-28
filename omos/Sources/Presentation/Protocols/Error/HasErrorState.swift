//
//  HasErrorState.swift
//  omos
//
//  Created by sangheon on 2023/05/27.
//

import ReactorKit
import RxSwift

// MARK: - HasErrorState

protocol HasErrorState {
    var myError: ReactorValue<MyError> { get }
}

// MARK: - HasErrorStream

protocol HasErrorStream {
    var myErrorStream: Observable<ReactorValue<MyError>> { get }
}

extension HasErrorStream where Self: Reactor, Self.State: HasErrorState {
    var myErrorStream: Observable<ReactorValue<MyError>> {
        state.map(\.myError)
    }
}

extension HasErrorStream where Self: HasViewModel, Self.ViewModel: HasErrorState {
    var myErrorStream: Observable<ReactorValue<MyError>> {
        viewModel.map(\.myError)
    }
}
