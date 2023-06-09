//
//  PasswordStateAction.swift
//  OnboardingFeature
//
//  Created by 이상헌 on 2023/07/06.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxSwift

import AppFoundation
import DesignSystem

// MARK: - PasswordPresentableState

struct PasswordPresentableState: HasLoadingState, HasErrorState {
    var revision = 0
    var myError: ReactorValue<MyError> = .init()
    var isLoading = false
    var isValidPasswordFormat = true
    var isValidRepasswordConfirm = false
    var isConfirmEnable = false
}

// MARK: - AgreementPresentableAction

enum PasswordPresentableAction {
    
}

// MARK: - PasswordPresentableListener

protocol PasswordPresentableListener: AnyObject {
    typealias Action = PasswordPresentableAction
    typealias State = PasswordPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}
