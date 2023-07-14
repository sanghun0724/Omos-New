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
import OnboardingDomainInterface
import AppFoundation

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
        case setError(MyError)
        case setPasswordFormatValidation(Bool)
        case setPasswordReconfirm(Bool)
    }
    
    // MARK: - Properties
    
    weak var router: PasswordRouting?
    weak var listener: PasswordListener?
    
    let initialState: PasswordPresentableState
    
    private let onboardingRepositoryService: OnboardingRepositoryService
    
    // MARK: - Initialization & Deinitialization
    
    init(
        onboardingRepositoryService: OnboardingRepositoryService,
        presenter: PasswordPresentable,
        initialState: PasswordPresentableState
    ) {
        self.initialState = initialState
        self.onboardingRepositoryService = onboardingRepositoryService
        
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
        switch action {
        case let .passwordsDidChange(password, repassword):
            return passwordValidationMutation(password: password, repassword: repassword)
        }
    }
    
    private func passwordFormatValidationMutation(password: String) -> Observable<Mutation> {
        let passwordValidationMutation: Observable<Mutation> =
        self.onboardingRepositoryService.isValidPassword(password: password)
            .map { .setPasswordFormatValidation($0) }
            .catchAndReturn(.setPasswordFormatValidation(false))
        
        return passwordValidationMutation
    }
    
    private func passwordValidationMutation(password: String, repassword: String) -> Observable<Mutation> {
        return Observable<Mutation>.create { [weak self] observer in
            let _ = self?.passwordFormatValidationMutation(password: password)
                .flatMap {
                    observer.onNext($0)
                    switch $0 {
                    case let .setPasswordFormatValidation(validation):
                        if validation {
                            return Observable<Void>.just(Void())
                        } else {
                            observer.onCompleted()
                            return Observable<Void>.never()
                        }
                    default: return Observable<Void>.never()
                    }
                }
                .flatMap {
                    self?.passwordEqualMutation(password: password, repassword: repassword) ?? .empty()
                }
                .flatMap {
                    observer.onNext($0)
                    return Observable<Void>.empty()
                }
                .subscribe()

                return Disposables.create()
        }
    }
    
    private func passwordEqualMutation(password: String, repassword: String) -> Observable<Mutation> {
        let passwordEqualMutation: Observable<Mutation> =
        self.onboardingRepositoryService.isEqualInputPasswords(password: password, repassword: repassword)
            .map { .setPasswordReconfirm($0) }
            .catchAndReturn(.setError(.defaultError))
        
        return passwordEqualMutation
    }
}

// MARK: - reduce

extension PasswordInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case let .setError(error):
            newState.myError
        case let .setPasswordFormatValidation(validation):
            newState.isValidPasswordFormat = validation
        case let .setPasswordReconfirm(validation):
            newState.isValidRepasswordConfirm = validation
        }
        
        return newState
    }
}
