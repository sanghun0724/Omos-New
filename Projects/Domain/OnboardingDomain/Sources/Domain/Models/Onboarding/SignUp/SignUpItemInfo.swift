//
//  SignUpItemInfo.swift
//  omos
//
//  Created by sangheon on 2023/06/03.
//

import AppFoundation

// MARK: - SigUpItemInfo

struct SignUpItemInfo: PropertyBuilderCompatible {
    var validationEmailCode: String = String()
    
    var email: String = String()
    var password: String = String()
    var nickname: String = String() 
}
