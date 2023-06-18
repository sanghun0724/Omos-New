//
//  CloseButtonBindable.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/22.
//

import RxSwift

public protocol CloseButtonBindable {
    func bindCloseButtonTapAction()
}

public extension CloseButtonBindable where Self: BaseViewController & HasDetachAction & HasDisposeBag {
    func bindCloseButtonTapAction() {
        navigationBarView.leftImageButton
            .rx
            .tap
            .preventDuplication()
            .bind(to: detachAction)
            .disposed(by: disposeBag)
    }
}
