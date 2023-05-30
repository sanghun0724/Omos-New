//
//  SignUpInteractor.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//
// TODO: remove comment
// -> email text 입력 -> 이메일 포맷 확인 -> 이메일 중복확인 -> 코드 보내고 -> 코드 확인 -> ...

import ReactorKit
import RIBs
import RxSwift

// MARK: - SignUpRouting

protocol SignUpRouting: ViewableRouting {
    
}

// MARK: - SignUpPresentable

protocol SignUpPresentable: Presentable {
    var listener: SignUpPresentableListener? { get set }
}

// MARK: - SignUpListener

protocol SignUpListener: AnyObject {}

// MARK: - SignUpInteractor

final class SignUpInteractor:
    PresentableInteractor<SignUpPresentable>,
    SignUpInteractable,
    SignUpPresentableListener,
    Reactor
{
    
    // MARK: - Reactor
    
    typealias Action = SignUpPresentableAction
    typealias State = SignUpPresentableState
    
    enum Mutation {
        case setError(MyError)
        case setLoading(Bool)
        case setHasAllTextFieldsInput(Bool)
        case setEmailReigisterValidation(Bool)
        case setEmailFormatValidation(Bool)
        case setPasswordFormatValidation(Bool)
        case setRePasswordFormatValidation(Bool)
        case attachNicknameRIB
    }
    
    // MARK: - Properties
    
    weak var router: SignUpRouting?
    weak var listener: SignUpListener?
    private let onboardingRepositoryService: OnboardingRepositoryService
    
    let initialState: SignUpPresentableState
    
    // MARK: - Initialization & Deinitialization
    
    init(
        presenter: SignUpPresentable,
        initialState: SignUpPresentableState,
        onboardingRepositoryService: OnboardingRepositoryService
    ) {
        self.initialState = initialState
        self.onboardingRepositoryService = onboardingRepositoryService
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    // MARK: - SignUpPresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
    
    deinit {
        log.verbose(type(of: self))
    }
}

// MARK: - mutate

extension SignUpInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .textDidChaged(email, password, rePassword):
            print()
        case .validateEmailButtonDidTap:
            print()
        case .validatePopupButtonDidTap:
            print()
        case .confirmButtonDidTap:
            print()
        }
        return .empty()
    }
    
    // MARK: - Validation
    
    private func confirmButtonEnableMutation(email: String, password: String, rePasswrod: String) -> Observable<Mutation> {
        return .empty()
    }
    
    
    
}

// MARK: - reduce

extension SignUpInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        return newState
    }
}
