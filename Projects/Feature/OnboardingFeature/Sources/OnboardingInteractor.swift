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
        case attachAgreementRIB(email: String)
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
            return kakaoLoginMutation()
        case .didTapAppleLoggedInButton:
            return .empty()
        case .didTapEmailSingUpButton:
            return .just(.attachSignUpRIB)
        case .didTapEmailLoggedInButton:
            return .just(.attachLoggedInRIB)
        }
    }
    
    private func kakaoLoginMutation() -> Observable<Mutation> {
        let kakaoLoginMutation: Observable<Mutation> = onboardingRepositoryService.kakaoLogin()
            .map{ .attachAgreementRIB(email: $0) }
            .catchAndReturn( .setError(.defaultError))
        
        let sequence: [Observable<Mutation>] = [
            .just(.setLoading(true)),
             kakaoLoginMutation,
            .just(.setLoading(false))
        ]
        
        return .concat(sequence)
    }
    
    private func appleLogin() -> Observable<Mutation> {
        return .empty()
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
    
    private func attachAgreemntRIBTransform() -> Observable<Mutation> {
        //self.router?.att()
        return .empty()
    }
    
}

// MARK: - reduce

extension OnboardingInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
//        switch mutation {
//        case let .attachAgreementRIB(email):
//            newState.testEmail = email
//        default:
//            print()
//        }
        
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
    
    func detachAgreementRIB() {
        
    }
}
