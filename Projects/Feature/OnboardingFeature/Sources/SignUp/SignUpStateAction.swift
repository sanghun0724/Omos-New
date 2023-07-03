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

struct SignUpPresentableState: HasLoadingState, HasErrorState {
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

enum SignUpPresentableAction {
    case emailValidationRequestButtonDidTap(email: String)
    case validationAlertButtonDidTap(inputCode: String)
    case passwordsDidChange(password: String, repassword: String)
    case confirmButtonDidTap
    case detach
}

// MARK: - SignUpPresentableListener

protocol SignUpPresentableListener: AnyObject, HasLoadingStream, HasErrorStream {
    typealias Action = SignUpPresentableAction
    typealias State = SignUpPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}
