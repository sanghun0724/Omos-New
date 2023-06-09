//
//  ErrorStreamBindable.swift
//  omos
//
//  Created by sangheon on 2023/05/27.
//

import Foundation

public protocol ErrorStreamBindable: AnyObject {
    func bindErrorStream(from listener: HasErrorStream)
}

public extension ErrorStreamBindable where Self: BaseViewController & HasAlertable & HasDisposeBag {
    func bindErrorStream(from listener: HasErrorStream) {
        listener.myErrorStream
            .distinctUntilChanged()
            .compactMap(\.value)
            .filter({ $0 != .noError })
            .withUnretained(self)
            .bind { owner, myError in
                owner.showAlert(title: myError.title, message: myError.messaage)
            }
            .disposed(by: disposeBag)
    }
}
