//
//  SignUpModel.swift
//  omos
//
//  Created by sangheon on 2023/06/03.
//

import Foundation

// MARK: - SignUpModel

struct SignUpModel {
    let validationEmailCode: String
    let currentPasswordText: String
    let currentRepasswordText: String
}

extension SignUpModel {
    static let empty: SignUpModel = .init(
        validationEmailCode: "",
        currentPasswordText: "",
        currentRepasswordText: ""
    )
}
