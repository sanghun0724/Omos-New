//
//  LoggedInInteractor.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import Foundation

import ReactorKit
import RIBs
import RxSwift

protocol LoggedInRouting: ViewableRouting {
    
}

// MARK: - LoggedInPresentable

protocol LoggedInPresentable: Presentable {
    var listener: LoggedInPresentableListener? { get set }
}

// MARK: - LoggedInListener

protocol LoggedInListener: AnyObject {
    
}

// MARK: - LgogedInInteractor

final class LoggedInInteractor:
    PresentableInteractor<LoggedInPresentable>,
    LoggedInInteractable,
    LoggedInPresentableListener,
    Reactor
{
    
    var initialState: LoggedInPresentableState
    
    // MARK: - Reactor
    
    typealias Action = LoggedInPresentableAction
    typealias State = LoggedInPresentableState
    
    enum Mutation {
        case setLoading(Bool)
        case setLoggedIn(Bool)
        case setHasLoggedInInput(Bool)
        case setEmailValidation(Bool)
        case setPasswordValidation(Bool)
    }
    
    // MARK: - Properties
    
    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?
    private let onboardingRepositoryService: OnboardingRespositoryService
    
    // MARK: Initializition & Deinitialization
    
    init(
        presenter: LoggedInPresentable,
        initialState: LoggedInPresentableState,
        onboardingRepositoryService: OnboardingRespositoryService
    ) {
        self.initialState = initialState
        self.onboardingRepositoryService = onboardingRepositoryService
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    deinit {
        Log.verbose(type(of: self))
    }
    
}

// MARK: - Reactor

extension LoggedInInteractor {
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
    
    // MARK: - mutate
    
    func mutate(action: LoggedInPresentableAction) -> Observable<Mutation> {
        switch action {
        case let .textDidChanged(email, password):
            return self.loggedInButtonEnableMutation(email: email, password: password)
        case let .localLoginButtonDidTap(email, password):
            return self.loggedInInputValidatioMutation(email: email, password: password)
        case .kakaoLoginButtonDidTap:
            return .empty()
        case .appleLoginButtonDidTap:
            return .empty()
        }
    }
    
    // MARK: - Validation
    
    private func loggedInButtonEnableMutation(email: String, password: String) -> Observable<Mutation> {
        return Observable<Mutation>.create { observer in
            if email.isEmpty || password.isEmpty {
                observer.onNext(.setHasLoggedInInput(false))
            } else {
                observer.onNext(.setHasLoggedInInput(true))
            }
            return Disposables.create()
        }
    }
    
    private func loggedInInputValidatioMutation(email: String, password: String) -> Observable<Mutation> {
        let validations = [emailValidationMutation(email: email), passwordValidationMutation(password: password)]
        if isValidLoggedInInputs(validations) {
            return self.loggedInMutation(email: email, password: password)
        }
        
        return .concat(validations)
    }
    
    /// 유효성을 검사한 후 로그인 Request 를 날리기 위함
    private func isValidLoggedInInputs(_ mutations: [Observable<Mutation>]) -> Bool {
        var isValidEmail = false
        var isValidPassword = false
        
        mutations.forEach { mutation in
            let _ = mutation.map {
                switch $0 {
                case let .setEmailValidation(emailValidation):
                    isValidEmail = emailValidation
                case let .setPasswordValidation(passwordValidation):
                    isValidPassword = passwordValidation
                default:
                    return
                }
            }
        }
        
        return isValidEmail && isValidPassword
    }
    
    private func emailValidationMutation(email: String) -> Observable<Mutation> {
        let emailValidationMutation: Observable<Mutation> = self.onboardingRepositoryService.isValidEmail(email: email)
            .map { .setEmailValidation($0) }
            .catchAndReturn( .setEmailValidation(false))
        
        return emailValidationMutation
    }
    
    private func passwordValidationMutation(password: String) -> Observable<Mutation> {
        let passwordValidationMutation: Observable<Mutation> = self.onboardingRepositoryService.isValidPassword(password: password)
            .map { .setPasswordValidation($0) }
            .catchAndReturn(.setPasswordValidation(false))
        
        return passwordValidationMutation
    }
    
    private func loggedInMutation(email: String, password: String) -> Observable<Mutation> {
        let loggedInMutation: Observable<Mutation> = self.onboardingRepositoryService
            .login(email: email, password: password)
            .map { .setLoggedIn($0) }
            .catchAndReturn(.setLoading(false))
        
        let sequence: [Observable<Mutation>] = [
            .just(.setLoading(true)),
            loggedInMutation,
            .just(.setLoading(false))
        ]
        
        return .concat(sequence)
    }
    
}

// MARK: - transform mutation

extension LoggedInInteractor {
    
}

// MARK: reduce

extension LoggedInInteractor {
    func reduce(state: LoggedInPresentableState, mutation: Mutation) -> LoggedInPresentableState {
        var newState = state
        
        switch mutation {
        case let .setLoading(loading):
            newState.isLoading = loading
        case let .setLoggedIn(loggedIn):
            newState.isValidLoggedIn = loggedIn
        case let .setEmailValidation(emailValidation):
            newState.isValidEmailFormat = emailValidation
        case let .setPasswordValidation(passwordValidation):
            newState.isValidPasswordFormat = passwordValidation
        case let .setHasLoggedInInput(validation):
            newState.hasLoggedInInput = validation
        }
        
        return newState
    }
}
