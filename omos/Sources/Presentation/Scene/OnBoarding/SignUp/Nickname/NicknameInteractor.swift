//
//  NicknameInteractor.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import ReactorKit
import RIBs
import RxSwift

// MARK: - NicknameRouting

protocol NicknameRouting: ViewableRouting {
    func attachTodayRIB()
    func detachTodayRIB()
}

// MARK: - NicknamePresentable

protocol NicknamePresentable: Presentable {
    var listener: NicknamePresentableListener? { get set }
}

// MARK: - NicknameListener

protocol NicknameListener: AnyObject {}

// MARK: - NicknameInteractor

final class NicknameInteractor:
    PresentableInteractor<NicknamePresentable>,
    NicknameInteractable,
    NicknamePresentableListener,
    Reactor
{
    
    // MARK: - Reactor
    
    typealias Action = NicknamePresentableAction
    typealias State = NicknamePresentableState
    
    enum Mutation {
        case setError(MyError)
        case setLoading(Bool)
        case setNicknameFormatValidation(Bool)
        case toggleTerms(Bool)
        case togglePolicy(Bool)
        case showTermsDetail
        case showPolicyDetail
        case attachTodayRIB
        case detach
    }
    
    // MARK: - Properties
    
    weak var router: NicknameRouting?
    weak var listener: NicknameListener?
    private let onboardingRepositoryService: OnboardingRepositoryService
    
    let initialState: NicknamePresentableState
    
    // MARK: - Initialization & Deinitialization
    
    init(
        presenter: NicknamePresentable,
        initialState: NicknamePresentableState,
        onboardingRepositoryService: OnboardingRepositoryService
    ) {
        self.initialState = initialState
        self.onboardingRepositoryService = onboardingRepositoryService
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    // MARK: - NicknamePresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
    
    deinit {
        log.verbose(type(of: self))
    }
}

// MARK: - mutate

extension NicknameInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .nicknameTextFieldDidChange(nickname):
            return nicknameValidationMutation(nickname: nickname)
        case let .toggleTerms(toggled):
            return .just(.toggleTerms(toggled))
        case let .togglePolicy(toggled):
            return .just(.togglePolicy(toggled))
        case .showTermsDetail:
            return .just(.showTermsDetail)
        case .showPolicyDetail:
            return .just(.showPolicyDetail)
        case .confirmButtonDidTap:
            return signUpMutation()
        case .detach:
            return .just(.detach)
        }
    }
    
    // MARK: - validation
    
    private func nicknameValidationMutation(nickname: String) -> Observable<Mutation> {
        let nicknameValidationMutation: Observable<Mutation> = onboardingRepositoryService.isValidNickname(nickname: nickname)
            .map { .setNicknameFormatValidation($0) }
            .catchAndReturn(.setError(.defaultError))
        
        return nicknameValidationMutation
    }
    
    private func signUpMutation() -> Observable<Mutation> {
        let signUpMutation: Observable<Mutation> = onboardingRepositoryService.signUp()
            .map { $0 ? .attachTodayRIB : .setError(.defaultError) }
            .catchAndReturn(.setError(.defaultError))
        
        return signUpMutation
    }
    
}

// MARK: transform

extension NicknameInteractor {
    
    func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
       return mutation
            .withUnretained(self)
            .flatMap { owner, mutation -> Observable<Mutation> in
                switch mutation {
                case .attachTodayRIB:
                    return owner.attachTodayRIB()
                case .detach:
                    return owner.detachTransform()
                default:
                    return .just(mutation)
                }
            }
    }
    
    private func attachTodayRIB() -> Observable<Mutation> {
        self.router?.attachTodayRIB()
        return .empty()
    }
    
    private func detachTransform() -> Observable<Mutation> {
        self.router?.detachTodayRIB()
        return .empty()
    }
}

// MARK: - reduce

extension NicknameInteractor {
    func reduce(state: NicknamePresentableState, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case let .setError(error):
            newState.isLoading = false
            newState.revision = state.revision + 1
            newState.myError = ReactorValue(revision: newState.revision, value: error)
        case let .setLoading(loading):
            newState.isLoading = loading
        case let .setNicknameFormatValidation(validation):
            newState.isValidNicknameFormat = validation
        case let .toggleTerms(toggled):
            newState.termsToggled = toggled
        case let .togglePolicy(toggled):
            newState.policyToggled = toggled
        case .showTermsDetail:
            newState.showTermsDetail = Void()
        case .showPolicyDetail:
            newState.showPolicyDetail = Void()
        default:
            log.debug("Do Nothing when \(mutation)")
        }
        
        return newState
    }
}
