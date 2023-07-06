//
//  PasswordInteractor.swift
//  OnboardingFeature
//
//  Created by 이상헌 on 2023/07/06.
//  Copyright © 2023 Omos. All rights reserved.
//

import ReactorKit
import RIBs
import RxSwift

import OnboardingFeatureInterface

// MARK: - PasswordPresentable

protocol PasswordPresentable: Presentable {
    var listener: PasswordPresentableListener? { get set }
}

// MARK: - PasswordInteractor

final class PasswordInteractor:
    PresentableInteractor<PasswordPresentable>,
    PasswordInteractable,
    PasswordPresentableListener,
    Reactor
{
    
    // MARK: - Reactor
    
    typealias Action = PasswordPresentableAction
    typealias State = PasswordPresentableState
    
    enum Mutation {
        
    }
    
    // MARK: - Properties
    
    weak var router: PasswordRouting?
    weak var listener: PasswordListener?
    
    let initialState: PasswordPresentableState
    
    // MARK: - Initialization & Deinitialization
    
    init(
        presenter: PasswordPresentable,
        initialState: PasswordPresentableState
    ) {
        self.initialState = initialState
        
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    // MARK: - PasswordPresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
}

// MARK: - mutate

extension PasswordInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
}

// MARK: - reduce

extension PasswordInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        return newState
    }
}
