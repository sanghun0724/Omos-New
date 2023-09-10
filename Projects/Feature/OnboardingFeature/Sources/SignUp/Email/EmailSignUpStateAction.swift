//
//  SignUpStateAction.swift
//  SignUpFeature
//
//  Created by sangheon on 2023/06/18.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxSwift

import AppFoundation
import DesignSystem

// MARK: - SignUpPresentableState

struct EmailSignUpPresentableState: HasLoadingState, HasErrorState {
    var revision = 0
    var myError: ReactorValue<MyError> = .init()
    var isLoading = false
    var isValidEmailFormat = true
    var isSuccessEmailCertification: ReactorValue<Bool> = .init()
    var isConfirmEnable = false
    var isShowValdiationConfirmTextField = false
    var isEmailTextFieldEmpty = true
    var isValidCodeFormat = false
}

// MARK: - SignUpPresentableAction

enum EmailSignUpPresentableAction {
    case emailValidationRequestButtonDidTap(email: String)
    case validationCodeConfirmButtonDidTap(inputCode: String)
    case emailTextFieldDidChanged(email: String)
    case validationCodeTextFieldDidChanged(code: String)
    case confirmButtonDidTap
    case detach
}

// MARK: - SignUpPresentableListener

protocol EmailSignUpPresentableListener: AnyObject, HasLoadingStream, HasErrorStream {
    typealias Action = EmailSignUpPresentableAction
    typealias State = EmailSignUpPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}
