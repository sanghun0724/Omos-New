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
        
    }
}

// MARK: - reduce

extension AgreementInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        return newState
    }
}
