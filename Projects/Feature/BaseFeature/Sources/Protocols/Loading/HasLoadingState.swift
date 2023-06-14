//
//  HasLoadingState.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import ReactorKit
import RxSwift

public protocol HasLoadingState {
    var isLoading: Bool { get }
}

// MARK: HasLoadingStream

public protocol HasLoadingStream {
    var isLoadingStream: Observable<Bool> { get }
}

public extension HasLoadingStream where Self: Reactor, Self.State: HasLoadingState {
    var isLoadingStream: Observable<Bool> {
        state.map(\.isLoading)
    }
}

public extension HasLoadingStream where Self: HasViewModel, Self.ViewModel: HasLoadingState {
    var isLoadingStream: Observable<Bool> {
        viewModel.map(\.isLoading)
    }
}
