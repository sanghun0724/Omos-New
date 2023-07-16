//
//  AgreementInteractor.swift
//  OnboardingFeatureInterface
//
//  Created by 이상헌 on 2023/07/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import ReactorKit
import RIBs
import RxSwift

import OnboardingFeatureInterface
import AppFoundation

// MARK: - AgreementPresentable

protocol AgreementPresentable: Presentable {
    var listener: AgreementPresentableListener? { get set }
}

// MARK: - AgreementInteractor

final class AgreementInteractor:
    PresentableInteractor<AgreementPresentable>,
    AgreementInteractable,
    AgreementPresentableListener,
    Reactor
{
    
    // MARK: - Reactor
    
    typealias Action = AgreementPresentableAction
    typealias State = AgreementPresentableState
    
    enum Mutation {
        case setIsAllAgreeSelectedMutation(Bool)
        case setIsServiceSelectedMutation(Bool)
        case setIsPrivacySelectedMutation(Bool)
        case attachNicknameRIB
    }
    
    // MARK: - Properties
    
    weak var router: AgreementRouting?
    weak var listener: AgreementListener?
    
    let initialState: AgreementPresentableState
    
    // MARK: - Initialization & Deinitialization
    
    init(
        presenter: AgreementPresentable,
        initialState: AgreementPresentableState
    ) {
        self.initialState = initialState
        
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    // MARK: - AgreementPresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
}

// MARK: - mutate

extension AgreementInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .allAgreeCheckButtonDidTap(toggled):
            return .just(.setIsAllAgreeSelectedMutation(!toggled))
        case let .serviceCheckButtonDidTap(toggled):
            return .just(.setIsServiceSelectedMutation(!toggled))
        case let .privacyCheckButtonDidTap(toggled):
            return .just(.setIsPrivacySelectedMutation(!toggled))
        case .confirmButtonDidTap:
            return .just(.attachNicknameRIB)
        }
    }
}

// MARK: - reduce

extension AgreementInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case let .setIsAllAgreeSelectedMutation(toggled):
            newState.isAllAgreeCheckBoxSelected = toggled
            newState.isServiceCheckBoxSelected = toggled
            newState.isPrivacyCheckBoxSelected = toggled
        case let .setIsServiceSelectedMutation(toggled):
            newState.isServiceCheckBoxSelected = toggled
        case let .setIsPrivacySelectedMutation(toggled):
            newState.isPrivacyCheckBoxSelected = toggled
        default:
            log.verbose("this is default \(mutation)")
        }
        
        return newState
    }
}

// MARK: transform State

extension AgreementInteractor {
    
    func transform(state: Observable<AgreementPresentableState>) -> Observable<AgreementPresentableState> {
        return state
            .map { newState in
                var newState = newState
            if (newState.isServiceCheckBoxSelected && newState.isPrivacyCheckBoxSelected) {
                 newState.isAllAgreeCheckBoxSelected = true
                return newState
            } else {
                newState.isAllAgreeCheckBoxSelected = false
                return newState
            }
        }
    }
}
