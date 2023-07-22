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
import RxKakaoSDKAuth
import KakaoSDKAuth
import RxKakaoSDKUser
import KakaoSDKUser

import AppFoundation
import CoreKit
import OnboardingDomainInterface

public class OnboardingRepositoryServiceImpl: OnboardingRepositoryService {
    private let onboardingRepository: OnboardingRepository
    
    private let signUpItemInfoRelay = BehaviorRelay(value: SignUpItemInfo())
    private var signUpItemInfoRelayBuilder: PropertyBuilder<SignUpItemInfo> { self.signUpItemInfoRelay.value.builder }
    
    private let tokenUtil = TokenUtils()
    
    public init(
        onboardingRepository: OnboardingRepository
    ) {
        self.onboardingRepository = onboardingRepository
    }
    
    public func login(email: String, password: String) -> Observable<Bool> {
        onboardingRepository.login(request: .init(email: email, password: password))
            .asObservable()
            .withUnretained(self)
            .map { owner, response in
                owner.tokenUtil.create("accessToken", account: "accessToken", value: response.accessToken)
                owner.tokenUtil.create("refreshToken", account: "refreshToken", value: response.refreshToken)
                return true
            }
    }
    
    public func kakaoLogin() -> Observable<String> {
        kakaoEmail()
            .withUnretained(self)
            .flatMap { owner, email in
                owner.onboardingRepository
                    .SNSlogin(request: .init(email: email, type: .KAKAO))
                    .asObservable()
                    .map { owner.setAuthTokens(accessToken: $0.accessToken, refreshToken: $0.refreshToken) }
                    .map { _ in return email }
            }
    }
    
    private func kakaoEmail() -> Observable<String> {
        let kakaoToken: Observable<OAuthToken>
        if (UserApi.isKakaoTalkLoginAvailable()) {
            kakaoToken = UserApi.shared.rx
                .loginWithKakaoTalk()
        } else {
            kakaoToken = UserApi.shared.rx
                .loginWithKakaoAccount()
        }
        
        return kakaoToken
            .flatMap { _ in UserApi.shared.rx.me() }
            .compactMap(\.kakaoAccount?.email)
    }
    
    public func signUp() -> Observable<Bool> {
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
    
    public func updateSnsEmailWithType(email: String, type: SignUpType) {
        setSignUpEmail(by: email)
        self.signUpItemInfoRelay.accept(self.signUpItemInfoRelayBuilder.type(type))
    }
    
    public func checkEmailDuplication(email: String) -> Observable<Bool> {
        onboardingRepository.checkEmailDuplication(request: .init(email: email))
            .asObservable()
            .map(\.state)
    }
    
    public func requestAuthEmailCode(email: String) -> Observable<Bool> {
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
    
    public func isValidEmail(email: String) -> Observable<Bool> {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return .just(emailTest.evaluate(with: email))
    }
    
    public func isValidPassword(password: String) -> Observable<Bool> {
        let passwordRegEx = "[A-Za-z0-9!_@$%^&+=]{8,16}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return .just(passwordTest.evaluate(with: password))
    }
    
    public func isValidNickname(nickname: String) -> Observable<Bool> {
        setSignUpNickname(by: nickname)
        let nicknameRegEx = "[가-힣A-Za-z0-9]{2,12}"
        let nicknameTest = NSPredicate(format: "SELF MATCHES %@", nicknameRegEx)
        return .just(nicknameTest.evaluate(with: nickname))
    }
    
    public func isEqualEmailValidationCode(inputCode: String) -> Observable<Bool> {
        .just(signUpItemInfoRelay.value.validationEmailCode == inputCode)
    }
    
    public func isEqualInputPasswords(password: String, repassword: String) -> Observable<Bool> {
        setSignUpPassword(by: password)
        return .just(password == repassword)
    }
    
    /// keyChain에 토큰들을 저장
    private func setAuthTokens(accessToken: String, refreshToken: String) {
        tokenUtil.create("accessToken", account: "accessToken", value: accessToken)
        tokenUtil.create("refreshToken", account: "refreshToken", value: refreshToken)
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
