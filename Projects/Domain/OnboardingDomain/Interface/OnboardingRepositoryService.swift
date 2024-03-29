
// MARK: OnboardingRepositoryService

import RxSwift

import AppFoundation

public protocol OnboardingRepositoryService {
    
    // Signing
    
    func login(email: String, password: String) -> Observable<Bool>
    func signUp() -> Observable<Bool>
    func kakaoLogin() -> Observable<Bool>
    func appleLogin(email: String) -> Observable<Bool>
    func checkEmailDuplication(email: String) -> Observable<Bool>
    func requestAuthEmailCode(email: String) -> Observable<Bool>
    
    // Validation
    
    func isValidEmail(email: String) -> Observable<Bool>
    func isValidPassword(password: String) -> Observable<Bool>
    func isValidNickname(nickname: String) -> Observable<Bool>
    func isEqualEmailValidationCode(inputCode: String) -> Observable<Bool>
    func isEqualInputPasswords(password: String, repassword: String) -> Observable<Bool>
    
}

