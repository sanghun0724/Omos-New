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
    var myError: MyError { get }
}

// MARK: - HasErrorStream

protocol MyErrorStream {
    var myErrorStream: Observable<MyError> { get }
}

extension MyErrorStream where Self: Reactor, Self.State: HasErrorState {
    var myErrorStream: Observable<MyError> {
        state.map(\.myError)
    }
}

extension MyErrorStream where Self: HasViewModel, Self.ViewModel: HasErrorState {
    var hasErrorStream: Observable<MyError> {
        viewModel.map(\.myError)
    }
}
