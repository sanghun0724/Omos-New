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
    var isValidPasswordFormat = true
    var isValidCheckPassword = false
    var isValidRepasswordConfirm = false
    var isSuccessEmailCertification = false
    var isConfirmEnable = false
    var isShowAlert = false
}

// MARK: - SignUpPresentableAction

enum EmailSignUpPresentableAction {
    case emailValidationRequestButtonDidTap(email: String)
    case validationAlertButtonDidTap(inputCode: String)
    case passwordsDidChange(password: String, repassword: String)
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
