//
//  CloseButtonBindable.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/22.
//

import RxSwift

protocol CloseButtonBindable {
    func bindCloseButtonTapAction()
}

extension CloseButtonBindable where Self: HasCloseButtonHeaderView & HasDetachAction & HasDisposeBag {
    func bindCloseButtonTapAction() {
        headerView.closeButton.rx.tap
            .throttle(.seconds(1), latest: false ,scheduler: MainScheduler.instance)
            .bind(to: detachAction)
            .disposed(by: disposeBag)
    }
}
