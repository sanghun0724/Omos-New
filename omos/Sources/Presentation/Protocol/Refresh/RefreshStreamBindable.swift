//
//  RefreshStreamBindable.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import Foundation

// MARK: - RefreshStreamBindable

protocol RefreshStreamBindable: AnyObject {
  func bindRefreshStream(from listener: HasRefreshStream)
}

typealias RefreshStreamBindableProtocols = HasDisposeBag & SkeletonControllable & PullToRefreshable

extension RefreshStreamBindable where Self: HasTableView & RefreshStreamBindableProtocols {
  func bindRefreshStream(from listener: HasRefreshStream) {
    listener.isRefreshStream
      .distinctUntilChanged()
      .withUnretained(self)
      .bind { this, isRefresh in
        this.skeletonView(this.tableView, shouldStartAnimationWhen: isRefresh)

        guard !isRefresh else { return }
        this.endRefreshing()
      }
      .disposed(by: disposeBag)
  }
}

extension RefreshStreamBindable where Self: HasCollectionView & RefreshStreamBindableProtocols {
  func bindRefreshStream(from listener: HasRefreshStream) {
    listener.isRefreshStream
      .distinctUntilChanged()
      .withUnretained(self)
      .bind { this, isRefresh in
        this.skeletonView(this.collectionView, shouldStartAnimationWhen: isRefresh)

        guard !isRefresh else { return }
        this.endRefreshing()
      }
      .disposed(by: disposeBag)
  }
}

