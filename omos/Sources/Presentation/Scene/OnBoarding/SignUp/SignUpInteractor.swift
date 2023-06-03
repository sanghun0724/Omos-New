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
        case setEmailReigisterValidation(Bool)
        case setIsEmailDuplication(Bool)
        case setEmailFormatValidation(Bool)
        case setPasswordFormatValidation(Bool)
        case setPasswordReconfirm(Bool)
        case showAlert(String)
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
        case let .emailTextDidChanged(email):
            return .empty()
        case let .passwordTextDidChanged(password):
            return .empty()
        case let .repasswordTextDidChanged(password):
            return .empty()
        case .emailValidationRequestButtonDidTap:
            return .empty()
        case .confirmButtonDidTap:
            return .just(.attachNicknameRIB)
        default: fatalError()
        }
    }
    
    // MARK: - Validation
    
    private func emailFormatValidationMutation(email: String) -> Observable<Mutation> {
        let emailValidationMutation: Observable<Mutation> =
        self.onboardingRepositoryService.isValidEmail(email: email)
            .map { .setEmailFormatValidation($0) }
            .catchAndReturn( .setEmailFormatValidation(false))
        
        return emailValidationMutation
    }
    
    private func isEmailDuplicatedMutation(email: String) -> Observable<Mutation> {
        let isEmailDuplicatedMutation: Observable<Mutation> =
        self.onboardingRepositoryService.checkEmailDuplication(email: email)
            .map { .setIsEmailDuplication($0) }
            .catchAndReturn(.setError(.defaultError))
        
        return isEmailDuplicatedMutation
    }
    
    private func emailReigisterValidation(inputCode: String) {
       // let emailReigisterValidation: Observable<Mutation> =
        
            
        // 코드 비교
    }
    
    private func passwordFormatValidationMutation(password: String) -> Observable<Mutation> {
        let passwordValidationMutation: Observable<Mutation> =
        self.onboardingRepositoryService.isValidPassword(password: password)
            .map { .setPasswordFormatValidation($0) }
            .catchAndReturn(.setPasswordFormatValidation(false))
        
        return passwordValidationMutation
    }
    
    private func repasswordReconfirmMutation(password: String, repassword: String) -> Observable<Mutation> {
        let repasswordReconfirmMutation: Observable<Mutation> =
        self.onboardingRepositoryService.isValidReconfirmPassword(password: password, repassword: repassword)
            .map { .setPasswordReconfirm($0) }
            .catchAndReturn(.setError(.defaultError))
        
        return repasswordReconfirmMutation
    }
    
}

// MARK: - reduce

extension SignUpInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        return newState
    }
}
