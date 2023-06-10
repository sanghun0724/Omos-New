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
        case setIsShowTermsDetail
        case setIsShowPolicyDetail
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
            return .empty()
        case let .toggleTerms(toggled):
            return .empty()
        case let .togglePolicy(toggled):
            return
        case .showTermsDetail:
            return .just(.setIsShowTermsDetail)
        case .showPolicyDetail:
            return .just(.setIsShowPolicyDetail)
        case .confirmButtonDidTap:
            return .just(.attachTodayRIB)
        case .detach:
            return .just(.detach)
        }
    }
    
    // MARK: - validation
    
    private func nicknameValidationMutation(nickname: String) -> Observable<Mutation> {
        
    }
}

// MARK: - reduce

extension NicknameInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        return newState
    }
}
