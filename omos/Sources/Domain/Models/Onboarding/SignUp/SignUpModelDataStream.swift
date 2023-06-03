//
//  SignUpModelDataStream.swift
//  omos
//
//  Created by sangheon on 2023/06/03.
//

import RxRelay
import RxSwift

// MARK: - SignUpModelData

struct SignUpModelData {
    let model: SignUpModel
    
    init(model: SignUpModel = .empty) {
        self.model = model
    }
}

// MARK: - SignUpModelDataStream

protocol SignUpModelDataStream {
    var signUpModel: Observable<SignUpModel> { get }
}

// MARK: - MutableSignUpModelDataStream

protocol MutableSignUpModelDataStream: SignUpModelDataStream {
    func updateCurrentPasswordText()
    func updateCurrnetRePasswordText()
    func updateValidationEmailCode()
}
// MARK: - SignUpModelDataStreamImpl

final class SignUpModelDataStreamImpl: MutableSignUpModelDataStream {
    
    // MARK: Properties
    
    var signUpModel: Observable<SignUpModel> { self.signUpModel.asObservable() }
    private let signUpModelDataRelay = BehaviorRelay<SignUpModelData>(value: SignUpModelData())
    
    // MARK: - Interanl methods
    
    func updateCurrentPasswordText() {
        
    }
    
    func updateCurrnetRePasswordText() {
        
    }
    
    func updateValidationEmailCode() {
        <#code#>
    }
}

