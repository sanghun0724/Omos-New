//
//  HasRefreshState.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import ReactorKit
import RxSwift

// MARK: - HasRefreshState

protocol HasRefreshState {
  var isRefresh: Bool { get }
}

// MARK: - HasRefreshStream

protocol HasRefreshStream {
  var isRefreshStream: Observable<Bool> { get }
}

extension HasRefreshStream where Self: Reactor, Self.State: HasRefreshState {
  var isRefreshStream: Observable<Bool> {
    state.map(\.isRefresh)
  }
}

extension HasRefreshStream where Self: HasViewModel, Self.ViewModel: HasRefreshState {
  var isRefreshStream: Observable<Bool> {
    viewModel.map(\.isRefresh)
  }
}
