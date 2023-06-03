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
    func updateCurrentPasswordText(with text: String)
    func updateCurrnetRePasswordText(with text: String)
    func updateValidationEmailCode(with code: String)
}
// MARK: - SignUpModelDataStreamImpl

final class SignUpModelDataStreamImpl: MutableSignUpModelDataStream {
    
    // MARK: Properties
    
    var signUpModel: Observable<SignUpModel> { self.signUpModelDataRelay.asObservable().map(\.model) }
    private let signUpModelDataRelay = BehaviorRelay<SignUpModelData>(value: SignUpModelData())
    
    // MARK: - Interanl methods
    
    func updateCurrentPasswordText(with text: String) {
        let currentSignUpModel = self.signUpModelDataRelay.value.model
        let data = SignUpModelData(model:
        SignUpModel(
            validationEmailCode: currentSignUpModel.validationEmailCode,
            currentPasswordText: text,
            currentRepasswordText: currentSignUpModel.currentRepasswordText
            )
        )
        self.signUpModelDataRelay.accept(data)
    }
    
    func updateCurrnetRePasswordText(with text: String) {
        let currentSignUpModel = self.signUpModelDataRelay.value.model
        let data = SignUpModelData(model:
        SignUpModel(
            validationEmailCode: currentSignUpModel.validationEmailCode,
            currentPasswordText: currentSignUpModel.currentPasswordText,
            currentRepasswordText: text
            )
        )
        self.signUpModelDataRelay.accept(data)
    }
    
    func updateValidationEmailCode(with code: String) {
        let currentSignUpModel = self.signUpModelDataRelay.value.model
        let data = SignUpModelData(model:
        SignUpModel(
            validationEmailCode: code,
            currentPasswordText: currentSignUpModel.currentPasswordText,
            currentRepasswordText: currentSignUpModel.currentRepasswordText
            )
        )
        self.signUpModelDataRelay.accept(data)
    }
}

