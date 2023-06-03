//
//  SignUpItemInfo.swift
//  omos
//
//  Created by sangheon on 2023/06/03.
//

import Foundation

// MARK: - SigUpItemInfo

struct SignUpItemInfo: PropertyBuilderCompatible {
    var validationEmailCode: String = String()
    var currentPasswordText: String = String()
    var currentRepasswordText: String = String()
}
