//
//  e.swift
//  omos
//
//  Created by sangheon on 2023/05/16.
//

import Foundation

// MARK: - LoggedInPresentableState

public struct LoggedInPresentableState: Equatable, HasLoadingState, HasErrorState {
    var revision = 0
    var isLoading = false
    var myError = ReactorValue(revision: 0, value: MyError.noError)
    var hasLoggedInInput = false 
    var isValidEmailFormat = true
    var isValidPasswordFormat = true
    
    public init() {}
}

