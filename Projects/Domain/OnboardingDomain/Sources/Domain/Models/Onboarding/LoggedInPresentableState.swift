//
//  e.swift
//  omos
//
//  Created by sangheon on 2023/05/16.
//

import Foundation

import AppFoundation
import CoreKit

// MARK: - LoggedInPresentableState

public struct LoggedInPresentableState: Equatable, HasLoadingState, HasErrorState {
    public var revision = 0
    public var isLoading = false
    public var myError = ReactorValue<MyError>(revision: 0, value: MyError.noError)
    public var hasLoggedInInput = false
    public var isValidEmailFormat = true
    public var isValidPasswordFormat = true
    
    public init() {}
}

