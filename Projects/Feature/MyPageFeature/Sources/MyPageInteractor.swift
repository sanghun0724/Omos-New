//
//  MyPageInteractor.swift
//  MyPageFeature
//
//  Created by 이상헌 on 2023/07/31.
//  Copyright © 2023 Omos. All rights reserved.
//

import ReactorKit
import RIBs
import RxSwift

import MyPageFeatureInterface

// MARK: - MyPageInteractor

final class MyPageInteractor:
    PresentableInteractor<MyPagePresentable>,
    MyPageInteractable,
    MyPagePresentableListener,
    Reactor
{
    
    // MARK: - Reactor
    
    typealias Action = MyPagePresentableAction
    typealias State = MyPagePresentableState
    
    enum Mutation {
        
    }
    
    // MARK: - Properties
    
    weak var router: MyPageRouting?
    weak var listener: MyPageListener?
    
    let initialState: MyPagePresentableState
    
    // MARK: - Initialization & Deinitialization
    
    init(
        presenter: MyPagePresentable,
        initialState: MyPagePresentableState
    ) {
        self.initialState = initialState
        
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    // MARK: - MyPagePresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
}

// MARK: - mutate

extension MyPageInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
}

// MARK: - reduce

extension MyPageInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        return newState
    }
}
