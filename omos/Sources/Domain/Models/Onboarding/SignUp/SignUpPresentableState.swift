//
//  SignUpPresentableState.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

import Foundation

// MARK: - SignUpPresentableState

struct SignUpPresentableState: HasLoadingState, HasErrorState {
    var myError: ReactorValue<MyError> = .init()
    var isLoading = false
    var hasLoggedInInput = false
    var isValidEmailFormat = true
    var isValidPasswordFormat = true
    var isValidCheckPassword = false
    var isSuccessEmailCertification = false
    var isConfirmEnable = false
}
