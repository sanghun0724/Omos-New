//
//  NicknamePresentableState.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import Foundation

struct NicknamePresentableState: HasLoadingState, HasErrorState {
    var revision = 0 
    var isLoading: Bool = false
    var myError: ReactorValue<MyError> = .init()
    var isValidNicknameFormat = false
    var termsToggled = false
    var policyToggled = false
    var isConfirmEnable = false
    var showTermsDetail = Void()
    var showPolicyDetail = Void()
}
