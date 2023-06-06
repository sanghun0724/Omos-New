//
//  LoginRepositoryService.swift
//  omos
//
//  Created by sangheon on 2023/05/18.
//
// Domain Service ~= Usecase

import Foundation

import RxRelay
import RxSwift

protocol OnboardingRepositoryService {
    func login(email: String, password: String) -> Observable<Bool>
    func checkEmailDuplication(email: String) -> Observable<Bool>
   // func validateAuthEmail(email: String) -> Observable<String>
    func requestAuthEmailCode(email: String) -> Observable<Void>
    func isValidEmail(email: String) -> Observable<Bool>
    func isValidPassword(password: String) -> Observable<Bool>
    func isEqualEmailValidationCode(inputCode: String) -> Observable<Bool>
}

class OnboardingRespositoryServiceImpl: OnboardingRepositoryService {
    
    private let onboardingRepository: OnboardingRepository
    
    private let signUpItemInfoRelay = BehaviorRelay(value: SignUpItemInfo())
    private var signUpItemInfoRelayBuilder: PropertyBuilder<SignUpItemInfo> { self.signUpItemInfoRelay.value.builder }
    
    init(
        onboardingRepository: OnboardingRepository
    ) {
        self.onboardingRepository = onboardingRepository
    }
    
    func login(email: String, password: String) -> Observable<Bool> {
        onboardingRepository.login(request: .init(email: email, password: password))
            .asObservable()
            .withUnretained(self)
            .map { owner, response in
                let tk = TokenUtils()
                tk.create("accessToken", account: "accessToken", value: response.accessToken)
                tk.create("refreshToken", account: "refreshToken", value: response.refreshToken)
                return true
            }
    }
    
    func checkEmailDuplication(email: String) -> Observable<Bool> {
        onboardingRepository.checkEmailDuplication(request: .init(email: email))
            .asObservable()
            .map(\.state)
    }
    
    func requestAuthEmailCode(email: String) -> Observable<Void> {
        onboardingRepository.verifyEmail(request: .init(email: email))
            .asObservable()
            .map(\.code)
            .withUnretained(self)
            .map { owner, code in
                owner.updateValidationEmailCode(with: code)
                return Void()
            }
    }
    
    // MARK: - business logic
    
    func isValidEmail(email: String) -> Observable<Bool> {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return .just(emailTest.evaluate(with: email))
    }
    
    func isValidPassword(password: String) -> Observable<Bool> {
        let passwordRegEx = "[A-Za-z0-9!_@$%^&+=]{8,16}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return .just(passwordTest.evaluate(with: password))
    }
    
    func isEqualEmailValidationCode(inputCode: String) -> Observable<Bool> {
        .just(signUpItemInfoRelay.value.validationEmailCode == inputCode)
    }
    
    func isEqualInputPasswords(password: String, repassword: String) -> Observable<Bool> {
        .just(password == repassword)
    }
    
    // MARK: - Private methods
    
    private func updateValidationEmailCode(with code: String) {
        self.signUpItemInfoRelay.accept(self.signUpItemInfoRelayBuilder.validationEmailCode(code))
    }
    
    private func updatePasswordText(with text: String) {
        self.signUpItemInfoRelay.accept(self.signUpItemInfoRelayBuilder.currentPasswordText(text))
    }
    
    private func updateRepasswordText(with text: String) {
        self.signUpItemInfoRelay.accept(self.signUpItemInfoRelayBuilder.currentRepasswordText(text))
    }
    
        
}
