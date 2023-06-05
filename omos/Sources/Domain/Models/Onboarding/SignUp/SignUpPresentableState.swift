//
//  SignUpPresentableState.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

import Foundation

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
