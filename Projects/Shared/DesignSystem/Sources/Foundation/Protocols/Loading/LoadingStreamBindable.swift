//
//  LoadingStreamBindable.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import RxSwift

public protocol LoadingStreamBindable: AnyObject {
    func bindLoadingStream(from listener: HasLoadingStream)
}

public extension LoadingStreamBindable where Self: HasTableView & HasDisposeBag & SkeletonControllable {
    func bindLoadingStream(from listener: HasLoadingStream) {
        listener.isLoadingStream
            .distinctUntilChanged()
            .withUnretained(self)
            .bind { this, isLoading in
                this.skeletonView(this.tableView, shouldStartAnimationWhen: isLoading)
            }
            .disposed(by: disposeBag)
    }
}

public extension LoadingStreamBindable where Self: HasCollectionView & HasDisposeBag & SkeletonControllable {
    func bindLoadingStream(from listener: HasLoadingStream) {
        listener.isLoadingStream
            .distinctUntilChanged()
            .withUnretained(self)
            .bind { this, isLoading in
                this.skeletonView(this.collectionView, shouldStartAnimationWhen: isLoading)
            }
            .disposed(by: disposeBag)
    }
}

public extension LoadingStreamBindable where Self: BaseViewController & HasDisposeBag {
    func bindLoadingStream(from listener: HasLoadingStream) {
        listener.isLoadingStream
            .distinctUntilChanged()
            .bind(to: self.rx.isLoadingAnimating)
            .disposed(by: disposeBag)
    }
}
