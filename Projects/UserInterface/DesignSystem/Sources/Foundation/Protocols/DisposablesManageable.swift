//
//  DisposablesManageable.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/19.
//

import RxSwift

protocol DisposablesManageable {
    func disposeDisposables()
    func resetDisposables()
}

extension DisposablesManageable where Self: HasCompositeDisposable {
    func disposeDisposables() {
        disposables.dispose()
    }
    
    func resetDisposables() {
        disposables.dispose()
        disposables = CompositeDisposable()
    }
}
