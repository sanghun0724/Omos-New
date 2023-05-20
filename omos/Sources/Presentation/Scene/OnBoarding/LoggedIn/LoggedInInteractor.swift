//
//  LoggedInInteractor.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

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
        case setValidation(Bool)
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
        case .viewDidLoad:
            return .empty()
        case let .localLoginButtonDidTap(email, password):
            return self.validationMutation(email: email, password: password)
        case .kakaoLoginButtonDidTap:
            return .empty()
        }
    }
    
    private func validationMutation(email: String, password: String) -> Observable<Mutation> {
        let validationMutation: Observable<Mutation> = self.onboardingRepositoryService
            .login(email: email, password: password)
            .map { .setValidation($0) }
            .catchAndReturn(.setLoading(false))
        
        let sequence: [Observable<Mutation>] = [
            .just(.setLoading(true)),
            validationMutation,
            .just(.setLoading(false))
        ]
        
        return .concat(sequence)
    }
    
}

// MARK: reduce

extension LoggedInInteractor {
    func reduce(state: LoggedInPresentableState, mutation: Mutation) -> LoggedInPresentableState {
        var newState = state
        
        switch mutation {
        case let .setLoading(loading):
            newState.isLoading = loading
        case let .setValidation(validation):
            newState.isValidLoggedIn = validation
        }
        
        return newState
    }
}
