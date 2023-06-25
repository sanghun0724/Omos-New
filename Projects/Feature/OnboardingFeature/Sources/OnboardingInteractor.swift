//
//  OnboardingInteractor.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/06/25.
//  Copyright © 2023 Omos. All rights reserved.
//

import ReactorKit
import RIBs
import RxSwift

import OnboardingFeatureInterface

// MARK: - OnboardingPresentable

protocol OnboardingPresentable: Presentable {
    var listener: OnboardingPresentableListener? { get set }
}

// MARK: - OnboardingInteractor

final class OnboardingInteractor:
    PresentableInteractor<OnboardingPresentable>,
    OnboardingInteractable,
    OnboardingPresentableListener,
    Reactor
{
    
    // MARK: - Reactor
    
    typealias Action = OnboardingPresentableAction
    typealias State = OnboardingPresentableState
    
    enum Mutation {
        
    }
    
    // MARK: - Properties
    
    weak var router: OnboardingRouting?
    weak var listener: OnboardingListener?
    
    let initialState: OnboardingPresentableState
    
    // MARK: - Initialization & Deinitialization
    
    init(
        presenter: OnboardingPresentable,
        initialState: OnboardingPresentableState
    ) {
        self.initialState = initialState
        
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    // MARK: - OnboardingPresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
}

// MARK: - mutate

extension OnboardingInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
}

// MARK: - reduce

extension OnboardingInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        return newState
    }
}
