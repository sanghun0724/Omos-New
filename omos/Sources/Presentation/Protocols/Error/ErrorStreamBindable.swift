//
//  ErrorStreamBindable.swift
//  omos
//
//  Created by sangheon on 2023/05/27.
//

import Foundation

protocol ErrorStreamBindable: AnyObject {
    func bindErrorStream(from listener: MyErrorStream)
}

extension ErrorStreamBindable where Self: BaseViewController & HasAlertable & HasDisposeBag {
    func bindErrorStream(from listener: MyErrorStream) {
        listener.myErrorStream
            .distinctUntilChanged()
            .withUnretained(self)
            .bind { owner, myError in
                owner.showAlert(title: myError.title, message: myError.messaage)
            }
            .disposed(by: disposeBag)
    }
}
