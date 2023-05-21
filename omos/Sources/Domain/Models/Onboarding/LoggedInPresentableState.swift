//
//  e.swift
//  omos
//
//  Created by sangheon on 2023/05/16.
//

import Foundation

struct LoggedInPresentableState: Equatable {
    var isValidLoggedIn = true
    var isLoading = false
    var hasLoggedInInput = false 
    var isValidEmailFormat = false
    var isValidPasswordFormat = false
}

