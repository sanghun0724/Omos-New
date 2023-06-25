//
//  SignUpInteractor.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

import Foundation

import ReactorKit
import RIBs
import RxSwift

import OnboardingFeatureInterface
import OnboardingDomain
import OnboardingDomainInterface
import GlobalThirdPartyLibrary
import AppFoundation
import DesignSystem


// MARK: - SignUpPresentable

protocol SignUpPresentable: Presentable {
    var listener: SignUpPresentableListener? { get set }
}

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
        case setIsSuccessRequestValidationCode(Bool)
        case setIsEmailDuplication(Bool)
        case setEmailFormatValidation(Bool)
        case setPasswordFormatValidation(Bool)
        case setPasswordReconfirm(Bool)
        case setEmailReigisterValidation(Bool)
        case attachNicknameRIB
        case detach
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
        case let .emailValidationRequestButtonDidTap(email):
            return emailValidationMutation(email: email)
        case let .validationAlertButtonDidTap(inputCode):
            return emailReigisterValidation(inputCode: inputCode)
        case let .passwordsDidChange(password, repassword):
            return passwordValidationMutation(password: password, repassword: repassword)
        case .confirmButtonDidTap:
            return .just(.attachNicknameRIB)
        case .detach:
            return .just(.detach)
        }
    }
    
    // MARK: - validation
    
    private func emailValidationMutation(email: String) -> Observable<Mutation> {
        return Observable<Mutation>.create { [weak self] observer in
            let _ = self?.emailFormatValidationMutation(email: email)
                .flatMap {
                    observer.onNext($0)
                    switch $0 {
                    case let .setEmailFormatValidation(validation):
                        if validation == false {
                            observer.onCompleted()
                            return Observable<Void>.never()
                        } else {
                            return Observable<Void>.just(Void())
                        }
                    default: return Observable<Void>.empty()
                    }
                }
                .flatMap {
                    self?.isEmailDuplicatedMutation(email: email) ?? .empty()
                }
                .flatMap {
                    observer.onNext($0)
                    switch $0 {
                    case let .setIsEmailDuplication(validation):
                        if validation == false {
                            observer.onCompleted()
                            return Observable<Void>.never()
                        } else {
                            return Observable<Void>.just(Void())
                        }
                    default: return Observable<Void>.empty()
                    }
                }
                .flatMap {
                    self?.sendValidationEmailCodeMutation(email: email) ?? .empty()
                }
                .flatMap {
                    observer.onNext($0)
                    return Observable<Void>.empty()
                }
                .subscribe()

                return Disposables.create()
        }
    }
    
    private func emailFormatValidationMutation(email: String) -> Observable<Mutation> {
        let emailFormatValidationMutation: Observable<Mutation> =
        self.onboardingRepositoryService.isValidEmail(email: email)
            .map { .setEmailFormatValidation($0) }
            .catchAndReturn( .setEmailFormatValidation(false))
        
        return emailFormatValidationMutation
    }
    
    private func isEmailDuplicatedMutation(email: String) -> Observable<Mutation> {
        let isEmailDuplicatedMutation: Observable<Mutation> =
        self.onboardingRepositoryService.checkEmailDuplication(email: email)
            .map {
                if $0 == false { return .setError(.duplicationError) }
                return .setIsEmailDuplication($0)
            }
            .catchAndReturn(.setError(.defaultError))
        
        let sequence: [Observable<Mutation>] = [
            .just(.setLoading(true)),
            isEmailDuplicatedMutation
        ]
        
        return .concat(sequence)
    }
    
    private func sendValidationEmailCodeMutation(email: String) -> Observable<Mutation> {
        let sendValidationEmailCodeMutation: Observable<Mutation> =
        self.onboardingRepositoryService.requestAuthEmailCode(email: email)
            .map { .setIsSuccessRequestValidationCode($0) }
            .catchAndReturn(.setError(.defaultError))
        
        let sequence: [Observable<Mutation>] = [
            .just(.setLoading(true)),
            sendValidationEmailCodeMutation,
            .just(.setLoading(false))
        ]
        
        return .concat(sequence)
    }
    
    private func emailReigisterValidation(inputCode: String) -> Observable<Mutation> {
        let emailReigisterValidation: Observable<Mutation> =
        self.onboardingRepositoryService.isEqualEmailValidationCode(inputCode: inputCode)
            .map { .setEmailReigisterValidation($0) }
            .catchAndReturn(.setError(.defaultError))
        
        return emailReigisterValidation
    }
    
    private func passwordFormatValidationMutation(password: String) -> Observable<Mutation> {
        let passwordValidationMutation: Observable<Mutation> =
        self.onboardingRepositoryService.isValidPassword(password: password)
            .map { .setPasswordFormatValidation($0) }
            .catchAndReturn(.setPasswordFormatValidation(false))
        
        return passwordValidationMutation
    }
    
    // MARK: Password
    
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

// MARK: - trasnform mutation

extension SignUpInteractor {
    
    func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
        return mutation
            .withUnretained(self)
            .flatMap { owner, mutation -> Observable<Mutation> in
                switch mutation {
                case .attachNicknameRIB:
                    return owner.attachNicknameRIBTransform()
                case .detach:
                    return owner.detachTransform()
                default:
                    return .just(mutation)
                }
            }
    }
    
    private func attachNicknameRIBTransform() -> Observable<Mutation> {
        self.router?.attachNicknameRIB()
        return .empty()
    }
    
    private func detachTransform() -> Observable<Mutation> {
        self.listener?.detachSignUpRIB()
        return .empty()
    }
    
}

// MARK: - reduce

extension SignUpInteractor {
    func reduce(state: SignUpPresentableState, mutation: Mutation) -> SignUpPresentableState {
        var newState = state

        switch mutation {
        case let .setError(error):
            newState.isLoading = false
            newState.revision = state.revision + 1
            newState.myError = ReactorValue(revision: newState.revision, value: error)
        case let .setLoading(loading):
            newState.isLoading = loading
        case let .setEmailFormatValidation(validation):
            newState.isValidEmailFormat = validation
        case .setIsSuccessRequestValidationCode(_):
            newState.isShowAlert = true
        case let .setEmailReigisterValidation(validation):
            newState.isSuccessEmailCertification = validation
        case let .setPasswordFormatValidation(validation):
            newState.isValidPasswordFormat = validation
        case let .setPasswordReconfirm(validation):
            newState.isValidRepasswordConfirm = validation
        default:
            log.debug("Do Nothing when \(mutation)")
        }
        
        return newState
    }
    
}
