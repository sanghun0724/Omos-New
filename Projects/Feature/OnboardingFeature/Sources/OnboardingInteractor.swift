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
import OnboardingDomainInterface
import AppFoundation

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
        case setError(MyError)
        case setLoading(Bool)
        case attachSignUpRIB
        case attachLoggedInRIB
        case attachAgreementRIB
        case attachTodayRIB
    }
     
    // MARK: - Properties
    
    weak var router: OnboardingRouting?
    weak var listener: OnboardingListener?
    
    let initialState: OnboardingPresentableState
    private let onboardingRepositoryService: OnboardingRepositoryService
    
    // MARK: - Initialization & Deinitialization
    
    init(
        presenter: OnboardingPresentable,
        initialState: OnboardingPresentableState,
        onboardingRepositoryService: OnboardingRepositoryService
    ) {
        self.initialState = initialState
        self.onboardingRepositoryService = onboardingRepositoryService
        
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
        case .didTapKakaoLoggedInButton:
            return kakaoAuthMutation()
        case let .didTapAppleLoggedInButton(email):
            return appleAuthMutation(email: email)
        case .didTapEmailSingUpButton:
            return .just(.attachSignUpRIB)
        case .didTapEmailLoggedInButton:
            return .just(.attachLoggedInRIB)
        }
    }
    
    private func kakaoAuthMutation() -> Observable<Mutation> {
        let kakaoAuthMutation: Observable<Mutation> = onboardingRepositoryService.kakaoLogin()
            .map { $0 ? .attachTodayRIB : .attachAgreementRIB }
        
        let sequence: [Observable<Mutation>] = [
            .just(.setLoading(true)),
            kakaoAuthMutation,
            .just(.setLoading(false))
        ]
        
        return .concat(sequence)
    }
    
    private func appleAuthMutation(email: String) -> Observable<Mutation> {
        let appleAuthMutation: Observable<Mutation> = onboardingRepositoryService.appleLogin(email: email)
            .map { $0 ? .attachTodayRIB : .attachAgreementRIB }
        
        let sequence: [Observable<Mutation>] = [
            .just(.setLoading(true)),
            appleAuthMutation,
            .just(.setLoading(false))
        ]
        
        return .concat(sequence)
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
                case .attachAgreementRIB:
                    return owner.attachAgreemntRIBTransform()
                default:
                    return .just(mutation)
                }
            }
    }
    
    private func attachSignUpRIBTransform() -> Observable<Mutation> {
        self.router?.attachEmailSignUpRIB()
        return .empty()
    }
    
    private func attachLoggedInRIBTransform() -> Observable<Mutation> {
        self.router?.attachLoggedInRIB()
        return .empty()
    }
    
    private func attachAgreemntRIBTransform() -> Observable<Mutation> {
        self.router?.attachAgreewmentRIB()
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
        self.router?.detachEmailSignUpRIB()
    }
    
    func detachLoggedInRIB() {
        self.router?.detachLoggedInRIB()
    }
    
    func detachAgreementRIB() {
        
    }
}
