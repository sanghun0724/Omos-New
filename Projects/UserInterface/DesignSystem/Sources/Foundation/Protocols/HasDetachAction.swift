//
//  HasDetachAction.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import RxRelay

protocol HasDetachAction {
    var detachAction: PublishRelay<Void> { get } 
}
