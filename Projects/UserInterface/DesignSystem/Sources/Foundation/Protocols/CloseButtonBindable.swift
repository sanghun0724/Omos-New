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

extension CloseButtonBindable where Self: BaseViewController & HasDetachAction & HasDisposeBag {
    func bindCloseButtonTapAction() {
        navigationBarView.leftImageButton
            .rx
            .tap
            .preventDuplication()
            .bind(to: detachAction)
            .disposed(by: disposeBag)
    }
}
