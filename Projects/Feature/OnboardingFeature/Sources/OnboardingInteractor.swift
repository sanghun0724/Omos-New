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
        case attachSignUpRIB
        case attachLoggedInRIB
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
        switch action {
        case .didTapkakaoLoggedInButton:
            return .empty()
        case .didTapAppleLoggedInButton:
            return .empty()
        case .didTapEmailSingUpButton:
            return .just(.attachSignUpRIB)
        case .didTapEmailLoggedInButton:
            return .just(.attachLoggedInRIB)
        }
    }
}

// MARK: Trasnform

extension OnboardingInteractor {
    func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
        return mutation
            .withUnretained(self)
            .flatMap { owner, mutation -> Observable<Mutation> in
                switch mutation {
                case .attachSignUpRIB:
                    return owner.attachSignUpRIBTransform()
                case .attachLoggedInRIB:
                    return owner.attachLoggedInRIBTransform()
                default:
                    return .just(mutation)
                }
            }
    }
    
    private func attachSignUpRIBTransform() -> Observable<Mutation> {
        self.router?.attachSignUpRIB()
        return .empty()
    }
    
    private func attachLoggedInRIBTransform() -> Observable<Mutation> {
        self.router?.attachLoggedInRIB()
        return .empty()
    }
    
}

// MARK: - reduce

extension OnboardingInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        return newState
    }
}

extension OnboardingInteractor {
    func detachSignUpRIB() {
        self.router?.detachSignUpRIB()
    }
    
    func detachLoggedInRIB() {
        self.router?.detachLoggedInRIB()
    }
}
