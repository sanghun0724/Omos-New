//
//  LoginRepository.swift
//  omos
//
//  Created by sangheon on 2023/05/17.
//

import RxSwift

// MARK: - LoginRepository

public protocol OnboardingRepository {
    /// 로컬 로그인
    func login(request: LoginRequest) -> Single<LoginResponse>
    /// 로컬 회원가입
    func localSignUp(request: SignUpRequest) -> Single<SignUpResponse>
    /// KAKAO 및 APPLE 로그인
    func SNSlogin(request: SNSLoginRequest) -> Single<SNSLoginResponse>
    /// KAKAO 및 APPLE 회원가입
    func SNSsingup(request: SNSSignUpRequest) -> Single<SNSSignUpResponse>
    /// 이메일 중복 체크
    func checkEmailDuplication(request: CheckEmailRequest) -> Single<CheckEmailResponse>
    /// 이메일 유효성 검사
    func verifyEmail(request: EmailValidationRequest) -> Single<EmailValidationResponse>
    /// 엑세스 토큰 리이슈 -> 리프레쉬
    func doRefresh(request: RefreshRequest) -> Single<RefreshRespone>
}

// MARK: - LoginRepositoryImpl

final class OnboardingRepositoryImpl: NetworkRepository<LoginTarget>, OnboardingRepository {
    
    // MARK: - API Request
    
    func login(request: LoginRequest) -> Single<LoginResponse> {
        provider.request(.login(request), type: LoginResponse.self)
    }
    
    func localSignUp(request: SignUpRequest) -> Single<SignUpResponse> {
        provider.request(.signUp(request), type: SignUpResponse.self)
    }
    
    func SNSlogin(request: SNSLoginRequest) -> Single<SNSLoginResponse> {
        provider.request(.SNSLogin(request), type: SNSLoginResponse.self)
    }
    
    func SNSsingup(request: SNSSignUpRequest) -> Single<SNSSignUpResponse> {
        provider.request(.SNSSignUp(request), type: SNSSignUpResponse.self)
    }
    
    func checkEmailDuplication(request: CheckEmailRequest) -> Single<CheckEmailResponse> {
        provider.request(.checkEmail(request), type: CheckEmailResponse.self)
    }
    
    func verifyEmail(request: EmailValidationRequest) -> Single<EmailValidationResponse> {
        provider.request(.emailValidation(request), type: EmailValidationResponse.self)
    }
    
    func doRefresh(request: RefreshRequest) -> Single<RefreshRespone> {
        provider.request(.doRefresh(request), type: RefreshRespone.self)
    }
    
}
