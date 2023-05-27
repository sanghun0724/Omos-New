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
    var hasError: Bool { get }
}

// MARK: - HasErrorStream

protocol HasErrorStream {
    var hasErrorStream: Observable<Bool> { get }
}

extension HasErrorStream where Self: Reactor, Self.State: HasErrorState {
    var hasErrorStream: Observable<Bool> {
        state.map(\.hasError)
    }
}

extension HasErrorStream where Self: HasViewModel, Self.ViewModel: HasErrorState {
    var hasErrorStream: Observable<Bool> {
        viewModel.map(\.hasError)
    }
}
