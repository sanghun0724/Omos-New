//
//  SignUpInteractor.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//
// TODO: remove comment
// -> email text 입력 -> 이메일 포맷 확인 -> 이메일 중복확인 -> 코드 보내고 -> 코드 확인 -> ...

import Foundation

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
        case setIsEmailDuplication(Bool)
        case setEmailFormatValidation(Bool)
        case setPasswordFormatValidation(Bool)
        case setPasswordReconfirm(Bool)
        case setEmailReigisterValidation(Bool)
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
        case let .emailValidationRequestButtonDidTap(email):
            return emailValidationMutation(email: email)
        case .validationAlertButtonDidTap:
            return .empty()
        case .confirmButtonDidTap:
            return .just(.attachNicknameRIB)
        }
    }
    
    // MARK: - Validation
    
    private func emailValidationMutation(email: String) -> Observable<Mutation> {
        return Observable<Mutation>.create { [weak self] observer in
            let creator =  self?.emailFormatValidationMutation(email: email)
                .flatMap {
                    observer.onNext($0)
                    switch $0 {
                    case let .setEmailFormatValidation(validation):
                        if validation == false {
                            observer.onCompleted()
                            return Observable<Void>.never()
                        }
                        return Observable<Void>.just(Void())
                    default: return Observable<Void>.just(Void())
                    }
                }
                .flatMap {
                    self?.isEmailDuplicatedMutation(email: email) ?? .empty()
                }
                .flatMap {
                    switch $0 {
                    case let .setIsEmailDuplication(validation):
                        if validation == false {
                            observer.onNext(.setError(.duplicationError))
                            observer.onCompleted()
                            return Observable<Void>.never()
                        } else {
                            observer.onNext(.setIsEmailDuplication(true))
                        }
                        return Observable<Void>.just(Void())
                    default: return Observable<Void>.just(Void())
                    }
                }
                .subscribe()
            
            return Disposables.create {
                creator?.dispose()
            }
            
        }.debug("check")

    }
    
    private func emailFormatValidationMutation(email: String) -> Observable<Mutation> {
        let emailFormatValidationMutation: Observable<Mutation> =
        self.onboardingRepositoryService.isValidEmail(email: email)
            .map { .setEmailFormatValidation($0) }
            .catchAndReturn( .setEmailFormatValidation(false))
        
        return emailFormatValidationMutation
    }
    
    private func isEnableRequestValidationEmailCode(_ mutations: [Observable<Mutation>]) -> Observable<Bool> {
        return Observable.combineLatest(mutations) { mutations -> Bool in
            return mutations.allSatisfy { mutation in
                switch mutation {
                case let .setEmailFormatValidation(emailValidation):
                    return emailValidation
                case let .setIsEmailDuplication(isDuplicated):
                    return isDuplicated
                default:
                    return true
                }
            }
        }
    }
    
    private func isEmailDuplicatedMutation(email: String) -> Observable<Mutation> {
        let isEmailDuplicatedMutation: Observable<Mutation> =
        self.onboardingRepositoryService.checkEmailDuplication(email: email)
            .map { .setIsEmailDuplication($0) }
            .catchAndReturn(.setError(.duplicationError))
        
        let sequence: [Observable<Mutation>] = [
            .just(.setLoading(true)),
            isEmailDuplicatedMutation,
            .just(.setLoading(false))
        ]
        
        return .concat(sequence)
    }
    
    private func emailReigisterValidation(inputCode: String) {
       // let emailReigisterValidation: Observable<Mutation> =
        
            
        // 코드 비교
    }
    
    private func allpasswordsValidation(password: String, repassword: String) -> Observable<Mutation> {
        return .empty()
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
            .empty()
        
        return repasswordReconfirmMutation
    }
    
}

// MARK: - reduce

extension SignUpInteractor {
    func reduce(state: SignUpPresentableState, mutation: Mutation) -> SignUpPresentableState {
        var newState = state
        
        switch mutation {
        case let .setError(error):
            newState.revision = state.revision + 1
            newState.myError = ReactorValue(revision: newState.revision, value: error)
        case let .setLoading(loading):
            newState.isLoading = loading
        case let .setEmailFormatValidation(validation):
            newState.isValidEmailFormat = validation
        case let .setIsEmailDuplication(validation):
            newState.isShowAlert = validation
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
