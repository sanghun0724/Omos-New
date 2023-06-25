//
//  LoggedInStateAction.swift
//  LoggedInFeature
//
//  Created by sangheon on 2023/06/18.
//  Copyright © 2023 Omos. All rights reserved.
//

import RxSwift

import CoreKit
import AppFoundation
import DesignSystem

// MARK: - LoggedInPresentableState

struct LoggedInPresentableState: Equatable, HasLoadingState, HasErrorState {
    var revision = 0
    var isLoading = false
    var myError = ReactorValue<MyError>(revision: 0, value: MyError.noError)
    var hasLoggedInInput = false
    var isValidEmailFormat = true
    var isValidPasswordFormat = true
}

// MARK: - LoggedInPresentableAction

enum LoggedInPresentableAction {
    case textDidChanged(email: String, password: String)
    case findButtonDidTap
    case signUpButtonDidTap
    case localLoginButtonDidTap(email: String, password: String)
    case kakaoLoginButtonDidTap
    case appleLoginButtonDidTap
}

// MARK: - LoggedInPresentableListener

protocol LoggedInPresentableListener: AnyObject, HasLoadingStream, HasErrorStream {
    typealias Action = LoggedInPresentableAction
    typealias State = LoggedInPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}
