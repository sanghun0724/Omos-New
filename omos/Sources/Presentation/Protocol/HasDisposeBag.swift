//
//  HasDisposeBag.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import RxSwift

protocol HasDisposeBag {
    var disposeBag: DisposeBag { get set }
}
