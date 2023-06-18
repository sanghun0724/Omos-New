//
//  HasDisposeBag.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import RxSwift

public protocol HasDisposeBag {
    var disposeBag: DisposeBag { get set }
}
