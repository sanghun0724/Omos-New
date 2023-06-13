//
//  HasCompositeDisposable.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/19.
//

import RxSwift

protocol HasCompositeDisposable: AnyObject {
    var disposables: CompositeDisposable { get set }
}
