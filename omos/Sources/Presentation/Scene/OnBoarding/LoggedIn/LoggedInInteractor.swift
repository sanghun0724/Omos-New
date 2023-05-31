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

// MARK: - LoggedInRouting

protocol LoggedInRouting: ViewableRouting {
    func attachFindRIB()
    func detachFindRIB()
    func attachSignUpRIB()
    func detachSignUpRIB()
    func attachTodayRIB()
    func detachTodayRIB()
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
        case setError(MyError)
        case setLoading(Bool)
        case setHasLoggedInInput(Bool)
        case setEmailFormatValidation(Bool)
        case setPasswordFormatValidation(Bool)
        case attachSignUpRIB
        case attachTodayRIB
        case attachFindRIB
    }
    
    // MARK: - Properties
    
    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?
    private let onboardingRepositoryService: OnboardingRepositoryService
    
    // MARK: Initializition & Deinitialization
    
    init(
        presenter: LoggedInPresentable,
        initialState: LoggedInPresentableState,
        onboardingRepositoryService: OnboardingRepositoryService
    ) {
        self.initialState = initialState
        self.onboardingRepositoryService = onboardingRepositoryService
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    deinit {
        log.verbose(type(of: self))
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
        case .findButtonDidTap:
            return .just(.attachFindRIB)
        case .signUpButtonDidTap:
            return .just(.attachSignUpRIB)
        case let .localLoginButtonDidTap(email, password):
            return self.loggedInInputValidationMutation(email: email, password: password)
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
    
    private func loggedInInputValidationMutation(email: String, password: String) -> Observable<Mutation> {
        let validations = [emailValidationMutation(email: email), passwordValidationMutation(password: password)]
        
        return isValidLoggedInInputs(validations)
            .flatMap { isValidate -> Observable<Mutation> in
                isValidate
                ? .concat(validations + [self.loggedInMutation(email: email, password: password)])
                : .concat(validations)
            }
    }
    
    /// 유효성을 검사한 후 로그인 Request 를 날리기 위함
    private func isValidLoggedInInputs(_ mutations: [Observable<Mutation>]) -> Observable<Bool> {
        return Observable.combineLatest(mutations) { mutations -> Bool in
            return mutations.allSatisfy { mutation in
                switch mutation {
                case let .setEmailFormatValidation(emailValidation):
                    return emailValidation
                case let .setPasswordFormatValidation(passwordValidation):
                    return passwordValidation
                default:
                    return true
                }
            }
        }
    }
    
    private func emailValidationMutation(email: String) -> Observable<Mutation> {
        let emailValidationMutation: Observable<Mutation> = self.onboardingRepositoryService.isValidEmail(email: email)
            .map { .setEmailFormatValidation($0) }
            .catchAndReturn( .setEmailFormatValidation(false))
        
        return emailValidationMutation
    }
    
    private func passwordValidationMutation(password: String) -> Observable<Mutation> {
        let passwordValidationMutation: Observable<Mutation> = self.onboardingRepositoryService.isValidPassword(password: password)
            .map { .setPasswordFormatValidation($0) }
            .catchAndReturn(.setPasswordFormatValidation(false))
        
        return passwordValidationMutation
    }
    
    private func loggedInMutation(email: String, password: String) -> Observable<Mutation> {
        let loggedInMutation: Observable<Mutation> = self.onboardingRepositoryService
            .login(email: email, password: password)
            .flatMap { isSuccess in
                if isSuccess {
                    return Observable<Mutation>.just(.attachTodayRIB)
                } else {
                    return Observable<Mutation>.just(.setError(.loggedInError))
                }
            }
            .catchAndReturn(.setError(.loggedInError))
        
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
    
    func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
        return mutation
            .withUnretained(self)
            .flatMap { owner, mutation -> Observable<Mutation> in
                switch mutation {
                case .attachSignUpRIB:
                    return owner.attachSignUpRIBTransform()
                case .attachTodayRIB:
                    return owner.attachTodayRIBTransform()
                default:
                    return .just(mutation)
                }
            }
    }
    
    private func attachFindRIBTransform() -> Observable<Mutation> {
        self.router?.attachFindRIB()
        return .empty()
    }
    
    /// Show SignUp Page
    private func attachSignUpRIBTransform() -> Observable<Mutation> {
      self.router?.attachSignUpRIB()
      return .empty()
    }
    
    /// Show Today Page
    private func attachTodayRIBTransform() -> Observable<Mutation> {
        self.router?.attachTodayRIB()
        return .empty()
    }
}

// MARK: reduce

extension LoggedInInteractor {
    func reduce(state: LoggedInPresentableState, mutation: Mutation) -> LoggedInPresentableState {
        var newState = state
        
        switch mutation {
        case let .setError(error):
            newState.revision = state.revision + 1
            newState.myError = ReactorValue(revision: newState.revision, value: error)
        case let .setLoading(loading):
            newState.isLoading = loading
        case let .setEmailFormatValidation(emailValidation):
            newState.isValidEmailFormat = emailValidation
        case let .setPasswordFormatValidation(passwordValidation):
            newState.isValidPasswordFormat = passwordValidation
        case let .setHasLoggedInInput(validation):
            newState.hasLoggedInInput = validation
        default:
            log.debug("Do Nothing when \(mutation)")
        }
        
        return newState
    }
}
