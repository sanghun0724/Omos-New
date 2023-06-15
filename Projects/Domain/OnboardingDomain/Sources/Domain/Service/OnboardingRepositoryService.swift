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

import AppFoundation
import CoreKit

public protocol OnboardingRepositoryService {
    func login(email: String, password: String) -> Observable<Bool>
    func signUp() -> Observable<Bool>
    func checkEmailDuplication(email: String) -> Observable<Bool>
    func requestAuthEmailCode(email: String) -> Observable<Bool>
    func isValidEmail(email: String) -> Observable<Bool>
    func isValidPassword(password: String) -> Observable<Bool>
    func isValidNickname(nickname: String) -> Observable<Bool>
    func isEqualEmailValidationCode(inputCode: String) -> Observable<Bool>
    func isEqualInputPasswords(password: String, repassword: String) -> Observable<Bool>
}

class OnboardingRespositoryServiceImpl: OnboardingRepositoryService {
    private let onboardingRepository: OnboardingRepository
    
    private let signUpItemInfoRelay = BehaviorRelay(value: SignUpItemInfo())
    private var signUpItemInfoRelayBuilder: PropertyBuilder<SignUpItemInfo> { self.signUpItemInfoRelay.value.builder }
    
    private let tokenUtil = TokenUtils()
    
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
                owner.tokenUtil.create("accessToken", account: "accessToken", value: response.accessToken)
                owner.tokenUtil.create("refreshToken", account: "refreshToken", value: response.refreshToken)
                return true
            }
    }
    
    func signUp() -> Observable<Bool> {
        onboardingRepository.localSignUp(
            request: .init(
                email: signUpItemInfoRelay.value.email,
                nickname: signUpItemInfoRelay.value.nickname,
                password: signUpItemInfoRelay.value.password
            )
        )
        .asObservable()
        .map(\.state)
    }
    
    func checkEmailDuplication(email: String) -> Observable<Bool> {
        onboardingRepository.checkEmailDuplication(request: .init(email: email))
            .asObservable()
            .map(\.state)
    }
    
    func requestAuthEmailCode(email: String) -> Observable<Bool> {
        onboardingRepository.verifyEmail(request: .init(email: email))
            .asObservable()
            .map(\.code)
            .withUnretained(self)
            .map { owner, code in
                owner.setSignUpEmail(by: email)
                owner.updateValidationEmailCode(with: code)
                return true
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
    
    func isValidNickname(nickname: String) -> Observable<Bool> {
        setSignUpNickname(by: nickname)
        let nicknameRegEx = "[가-힣A-Za-z0-9]{2,12}"
        let nicknameTest = NSPredicate(format: "SELF MATCHES &@", nicknameRegEx)
        return .just(nicknameTest.evaluate(with: nickname))
    }
    
    func isEqualEmailValidationCode(inputCode: String) -> Observable<Bool> {
        .just(signUpItemInfoRelay.value.validationEmailCode == inputCode)
    }
    
    func isEqualInputPasswords(password: String, repassword: String) -> Observable<Bool> {
        setSignUpPassword(by: password)
        return .just(password == repassword)
    }
    
    // MARK: - Private methods
    
    private func updateValidationEmailCode(with code: String) {
        self.signUpItemInfoRelay.accept(self.signUpItemInfoRelayBuilder.validationEmailCode(code))
    }
    
    private func setSignUpEmail(by email: String) {
        self.signUpItemInfoRelay.accept(self.signUpItemInfoRelayBuilder.email(email))
    }
    
    private func setSignUpPassword(by password: String) {
        self.signUpItemInfoRelay.accept(self.signUpItemInfoRelayBuilder.password(password))
    }
    
    private func setSignUpNickname(by nickname: String) {
        self.signUpItemInfoRelay.accept(self.signUpItemInfoRelayBuilder.nickname(nickname))
    }
    
}
