//
//  MyRecordStateAction.swift
//  MyRecordFeature
//
//  Created by 이상헌 on 2023/07/29.
//  Copyright © 2023 Omos. All rights reserved.
//
import Foundation

import RxSwift

import DesignSystem
import RecordDomain
import RecordDomainInterface
import AppFoundation
 
// MARK: - MyRecordPresentableState

struct MyRecordPresentableState: HasLoadingState, HasErrorState {
    var isLoading: Bool = false
    var myError: ReactorValue<MyError> = .init()
    var recordList: [MyRecordModel] = []
}

// MARK: - MyRecordPresentableAction

enum MyRecordPresentableAction {
    case seletedItem(IndexPath)
    case loadData
    case refresh
}

// MARK: - MyRecordPresentableListener

protocol MyRecordPresentableListener: AnyObject {
    typealias Action = MyRecordPresentableAction
    typealias State = MyRecordPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}



