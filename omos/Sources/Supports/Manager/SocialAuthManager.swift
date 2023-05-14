//
//  SocialAuthManager.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import UIKit
import AuthenticationServices
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

/*
 TODO: 해당 라이브러리를 사용하기 위해서는
 어떤 Library or SDK를 설치해야하는지 기술
 
 Apple Login
    - import AuthenticationServices
 
 Kakao Login
    - import KakaoSDKCommon  # 필수 요소를 담은 공통 모듈
    - import KakaoSDKAuth  # 사용자 인증
    - import KakaoSDKUser  # 카카오 로그인, 사용자 관리
 */


/*
 AppDelegate에 아래 함수 호출 필요
 
 KakaoSDKCommon.initSDK(appKey: "네이티브 앱 키")
 
 return true
 }
 
 func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
 if AuthApi.isKakaoTalkLoginUrl(url) {
 return AuthController.handleOpenUrl(url: url)
 }
 
 return false
 }
 */

final class SocialAuthManager: NSObject {
    
    enum SocialAuthType: String {
        case kakao
        case apple
        case none
    }
    
    static let shared = SocialAuthManager()
    private override init() { }
    
    // MARK: - Common variable, userDefaults
    
    // UserDefaults
    private let userDefaults = UserDefaults.standard
    private let socialAuthUdKey = "SOCIAL_AUTH_KEY"
    public var socialAuthType: SocialAuthType {
        get {
            if let socialAuth = userDefaults.string(forKey: socialAuthUdKey),
               let authType = SocialAuthType(rawValue: socialAuth) {
                return authType
            } else {
                return .none
            }
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: socialAuthUdKey)
            userDefaults.synchronize()
        }
    }
    
    public func checkedSocialAutoLogin(isSuccessAutoLogin: @escaping ((Bool) -> Void)) {
        switch socialAuthType {
        case .kakao:
            kakaoAutoLoginProcess { [weak self] isAutoLogin in
                self?.socialAuthType = isAutoLogin ? .kakao : .none
                isSuccessAutoLogin(isAutoLogin)
            }
        case .apple:
            if #available(iOS 13.0, *) {
                checkAppleLoginAuth { [weak self] isAutoLogin in
                    self?.socialAuthType = isAutoLogin ? .apple : .none
                    isSuccessAutoLogin(isAutoLogin)
                }
            } else {
                socialAuthType = .none
                isSuccessAutoLogin(false)
            }
        default:
            print("No Auth Type..")
            isSuccessAutoLogin(false)
        }
    }
    
    deinit {
        print(self)
    }
    
    // MARK: - Kakao 관련 variable
    
    enum Scope: String, CaseIterable {
        case profileNickname = "profile_nickname" // 닉네임
        case profileImage = "profile_image"   // 프로필 사진
        case accountEmail = "account_email"  // 카카오계정(이메일)
        case gender = "gender"    // 성별
        case ageRange = "age_range"   // 연령대
        case birthDay = "birthday"    // 생일
        case birthYear = "birthyear"  // 출생연도
        case phoneNumber = "phone_number" // 카카오계정(전화번호)
        case accountCI = "account_ci"    // CI(연계정보)
        
        func isAgreeCase(user: Account) -> Bool? {
            switch self {
            case .profileNickname:
                return user.profileNicknameNeedsAgreement
            case .profileImage:
                return user.profileImageNeedsAgreement
            case .accountEmail:
                return user.emailNeedsAgreement
            case .gender:
                return user.genderNeedsAgreement
            case .ageRange:
                return user.ageRangeNeedsAgreement
            case .birthDay:
                return user.birthdayNeedsAgreement
            case .birthYear:
                return user.birthyearNeedsAgreement
            case .phoneNumber:
                return user.phoneNumberNeedsAgreement
            case .accountCI:
                return user.ciNeedsAgreement
            }
        }
    }
    
    var kakaoLoginCompletion: ((Bool) -> Void)?
    var kakaoScopeComletion: ((ScopeReason) -> Void)?
    
    // MARK: - Apple 관련 variable, userDefaults
    
    private let appleUserIdentifierUdKey = "APPLE_USERIDENTIFIER_KEY"
    public var appleUserIdentifier: String? {
        get {
            return userDefaults.string(forKey: appleUserIdentifierUdKey)
        }
        set {
            userDefaults.set(newValue ?? "", forKey: appleUserIdentifierUdKey)
            userDefaults.synchronize()
        }
    }
    
    private var appleModalShowUpView: UIView!
    var appleLoginCompletion: ((AppleAuthData?) -> Void)?
    
}

// MARK: - Kakao Login Methods

extension SocialAuthManager {
    
    // 자동 로그인 프로세스
    private func kakaoAutoLoginProcess(completion: @escaping ((Bool) -> Void)) {
        if AuthApi.hasToken() { // 토큰 존재 여부 확인하기 ( API x )
            UserApi.shared.accessTokenInfo { user, error in // 가지고 있는 토큰이 유효한지 API로 요청
                if let error = error {
                    if let sdkError = error as? SdkError,
                       sdkError.isInvalidTokenError() {
                        // 토큰이 유효하지 않음 자동 로그인 실패
                        completion(false)
                    } else {
                        // 기타 에러이므로 자동 로그인 실패
                        print(error)
                        completion(false)
                    }
                } else {
                    // 토큰 유효성 체크 성공
                    print("로그인 성공")
                    completion(true)
                }
            }
        } else {
            // 토큰이 없으므로 자동 로그인 실패
            completion(false)
        }
    }
    
    // 카카오톡 앱으로 로그인 요청하기
    public func kakaoLogin(completion: ((Bool) -> Void)?) {
        kakaoLoginCompletion = completion
        
        // 카카오톡 앱 설치 유무 체크
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { [weak self] oauthToken, error in
                if let error = error {
                    print(error)
                    self?.kakaoLoginCompletion?(false)
                } else {
                    print("success")
                    self?.socialAuthType = .kakao
                    self?.kakaoLoginCompletion?(true)
                }
            }
        } else {
            // 카카오톡 앱이 확인 안됨
            // 웹 페이지로 로그인 요청
            kakaoWebLogin()
        }
    }
    
    // 웹 페이지로 카카오 로그인 시도
    public func kakaoWebLogin() {
        UserApi.shared.loginWithKakaoAccount { [weak self] oauthToken, error in
            if let error = error {
                print(error)
                self?.kakaoLoginCompletion?(false)
            } else {
                print("로그인 성공")
                self?.socialAuthType = .kakao
                self?.kakaoLoginCompletion?(true)
            }
        }
    }
    
    // 추가 동의받아야 할 것 리스트 업
    public func kakaoScope(needScopeList: [Scope], completion: ((ScopeReason) -> Void)?) {
        kakaoScopeComletion = completion
        
        UserApi.shared.me { [weak self] user, error in
            if let error = error {
                print(error)
                self?.kakaoScopeComletion?(.userDataError)
            } else {
                if let user = user?.kakaoAccount {
                    // 동의요청할 것만 리스트에 담아서 요청
                    // nil == 콘솔에서 동의항목 지정안함
                    // false == 유저가 이미 동의함
                    // true == 콘솔에서 동의항목 선택/필수인데 유저가 동의 안했음
                    // true이면 정보동의요청이 필요하다는 의미
                    
                    // !! 프로필(닉네임,사진) 관련한 정보들은 동의하지 않았음에도 false로 내려오는 이슈가 있음! 주의요망
                    let scopes = needScopeList.filter {
                        $0.isAgreeCase(user: user) == true
                    }.compactMap {
                        $0.rawValue
                    }
                    
                    // 추가동의항목 요청하기
                    self?.reqAgreeMent(scopes: scopes)
                }
            }
        }
    }
    
    // 추가동의항목 요청하기
    private func reqAgreeMent(scopes: [String]) {
        guard !scopes.isEmpty else {
            kakaoScopeComletion?(.alreadyAllAgreement)
            return
        }
        
        // 필요한 scope으로 동의항목을 필수로 요청 후 승인하면 토큰갱신이 된다.
        UserApi.shared.loginWithKakaoAccount(scopes: scopes) { [weak self] _, error in
            if let error = error {
                print(error)
                self?.kakaoScopeComletion?(.scopeReqFail)
            } else {
                print("동의요청완료")
                self?.kakaoScopeComletion?(.scopeReqSuccess)
            }
        }
    }
    
    // 사용자 정보 가져오기
    public func kakaoGetUserInfo(completion: @escaping ((User?) -> Void)) {
        UserApi.shared.me { [weak self] user, error in
            if let error = error {
                print(error)
                completion(nil)
            } else {
                if let user = user {
                    print("유저 정보 가져오기 성공")
                    completion(user)
                } else {
                    print("유저 정보 누락")
                    completion(nil)
                }
            }
        }
    }
    
    // 카카오 계정 로그아웃
    // API 요청 성공여부와 관계없이 토큰이 삭제 됨.
    public func kakaoLogout(completion: @escaping (() -> Void)) {
        UserApi.shared.unlink { [weak self] error in
            if let error = error {
                print(error)
                print("로그아웃 실패")
            } else {
                print("로그아웃 성공")
            }
            self?.socialAuthType = .none
            completion()
        }
    }
    
    // 카카오 계정과 앱 연결 해제
    public func kakaoUnlink(completion: @escaping (() -> Void)) {
        UserApi.shared.unlink { [weak self] error in
            if let error = error {
                print(error)
                print("연결해제 실패")
            } else {
                print("연결해제 성공")
            }
            self?.socialAuthType = .none
            completion()
        }
    }
    
}

// MARK: - Apple Login Methods

@available(iOS 13.0, *)
extension SocialAuthManager {
    
    // Apple Login 요청
    public func appleLoginProcessing(presentView view: UIView,
                                     completion: @escaping ((AppleAuthData?) -> Void)) {
        appleModalShowUpView = view
        appleLoginCompletion = completion
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    // Apple ID 연동 되어있는지 여부 판단(true: 연동, false: 연동X or ID Not Found)
    private func checkAppleLoginAuth(completion: @escaping ((Bool) -> Void)) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        
        guard let userIdentifier = appleUserIdentifier else {
            return completion(false)
        }
        
        appleIDProvider.getCredentialState(forUserID: userIdentifier) { credentialState, error in
            switch credentialState {
            case .authorized:
                completion(true)
            default:
                completion(false)
            }
        }
    }
    
}

// MARK: - [Apple Login] ASAuthorizationControllerDelegate

@available(iOS 13.0, *)
extension SocialAuthManager: ASAuthorizationControllerDelegate {
    
    // Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            /*
             * 계정 정보 데이터 설명
             [사용자 식별]
             - identityToken: Data?
                > 사용자에 대한 정보를 앱에 안전하게 전달하는 JWT(JSON Web Token)
             - authorizationCode: Data?
                > 앱이 서버와 상호 작용하는 데 사용하는 Token
             - user: String
                > 인증된 사용자의 고유한 식별자
             - fullName, email
                > 사용자가 설정한 이름과 이메일 주소
             */
            
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let nickname = (fullName?.givenName ?? "") + (!(fullName?.familyName?.isEmpty ?? true) ? " " : "") + (fullName?.familyName ?? "")
            let email = appleIDCredential.email
            
            appleUserIdentifier = userIdentifier
            socialAuthType = .apple
            let appleAuthData = AppleAuthData(userIdentifier: userIdentifier,
                                              userName: nickname,
                                              userEmail: email)
            appleLoginCompletion?(appleAuthData)
            print(appleAuthData)
        default:
            appleLoginCompletion?(nil)
            break
        }
    }
    
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
        appleLoginCompletion?(nil)
    }
    
}

// MARK: - [Apple Login] ASAuthorizationControllerPresentationContextProviding

@available(iOS 13.0, *)
extension SocialAuthManager: ASAuthorizationControllerPresentationContextProviding {
    
    // Modal을 어디에 띄울지?
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return appleModalShowUpView.window!
    }
    
}

struct AppleAuthData {
    let userIdentifier: String
    let userName: String?
    let userEmail: String?
}

enum ScopeReason {
    case userDataError  // 유저 데이터 API 요청 중 에러 ( 로그인 값 확인 필요 )
    case alreadyAllAgreement    // 추가 동의요청 할 것 없음
    case scopeReqFail   //  동의 요청 실패
    case scopeReqSuccess    // 동의 요청 성공
}
