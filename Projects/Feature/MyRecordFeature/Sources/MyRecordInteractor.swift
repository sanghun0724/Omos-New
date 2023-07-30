//
//  MyRecordInteractor.swift
//  MyRecordFeature
//
//  Created by 이상헌 on 2023/07/29.
//  Copyright © 2023 Omos. All rights reserved.
//

import ReactorKit
import RIBs
import RxSwift

import BaseFeature

// MARK: - MyRecordRouting

protocol MyRecordRouting: ViewableRouting {
    
}

// MARK: - MyRecordPresentable

protocol MyRecordPresentable: Presentable {
    var listener: MyRecordPresentableListener? { get set }
}

// MARK: - MyRecordListener

protocol MyRecordListener: AnyObject {}

// MARK: - MyRecordInteractor

final class MyRecordInteractor:
    PresentableInteractor<MyRecordPresentable>,
    MyRecordInteractable,
    MyRecordPresentableListener,
    Reactor
{
    
    // MARK: - Reactor
    
    typealias Action = MyRecordPresentableAction
    typealias State = MyRecordPresentableState
    
    enum Mutation {
        
    }
    
    // MARK: - Properties
    
    weak var router: MyRecordRouting?
    weak var listener: MyRecordListener?
    
    let initialState: MyRecordPresentableState
    
    // MARK: - Initialization & Deinitialization
    
    init(
        presenter: MyRecordPresentable,
        initialState: MyRecordPresentableState,
        imagePrefechWorker: ImagePrefet
    ) {
        self.initialState = initialState
        
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    // MARK: - MyRecordPresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
}

// MARK: - mutate

extension MyRecordInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
}

// MARK: - reduce

extension MyRecordInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        return newState
    }
}
