//
//  MyRecordStateAction.swift
//  MyRecordFeature
//
//  Created by 이상헌 on 2023/07/29.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxSwift
 
// MARK: - MyRecordPresentableState

struct MyRecordPresentableState {
    
}

// MARK: - MyRecordPresentableAction

enum MyRecordPresentableAction {
    
}

// MARK: - MyRecordPresentableListener

protocol MyRecordPresentableListener: AnyObject {
    typealias Action = MyRecordPresentableAction
    typealias State = MyRecordPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}



