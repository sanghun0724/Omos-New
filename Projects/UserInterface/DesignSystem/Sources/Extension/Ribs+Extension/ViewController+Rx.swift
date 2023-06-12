//
//  ViewController+Rx.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

#if os(iOS) || os(tvOS)

import UIKit
import RxSwift

extension Reactive where Base: UIViewController {
    /// Bindable sink for `showLoading()`, `hideLoading()` methods.
    public var isLoadingAnimating: Binder<Bool> {
        Binder(self.base) { _, active in
            if active {
                LoadingIndicator.showLoading()
            } else {
                LoadingIndicator.hideLoading()
            }
        }
    }
}

#endif
