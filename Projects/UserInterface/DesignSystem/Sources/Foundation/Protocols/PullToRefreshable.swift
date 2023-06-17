//
//  PullToRefreshable.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import UIKit

import RxRelay
import RxCocoa
import RxSwift

protocol PullToRefreshable {
    var refreshControl: UIRefreshControl { get }
    var refreshEvent: PublishRelay<Void> { get }
}

extension PullToRefreshable where Self: HasDisposeBag {
    func bindRefreshControlEvent() {
        refreshControl.rx.controlEvent(.valueChanged)
            .asObservable()
            .bind(to: refreshEvent)
            .disposed(by: disposeBag)
    }
    
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
}

extension PullToRefreshable where Self: HasTableView {
    func setRefreshCotrol() {
        tableView.refreshControl = refreshControl
    }
}

extension PullToRefreshable where Self: HasCollectionView {
    func setRefreshContorol() {
        collectionView.refreshControl = refreshControl
    }
}
