//
//  HasDetachAction.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import RxRelay

public protocol HasDetachAction {
    var detachAction: PublishRelay<Void> { get } 
}
