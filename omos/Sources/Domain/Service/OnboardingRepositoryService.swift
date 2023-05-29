//
//  LoginRepositoryService.swift
//  omos
//
//  Created by sangheon on 2023/05/18.
//
// Domain Service ~= Usecase

import Foundation

import RxSwift

protocol OnboardingRespositoryService {
    func login(email: String, password: String) -> Observable<Bool>
    func isValidEmail(email: String) -> Observable<Bool>
    func isValidPassword(password: String) -> Observable<Bool>
}

class OnboardingRespositoryServiceImpl: OnboardingRespositoryService {
    
    private let onboardingRepository: OnboardingRepository
    
    init(onboardingRepository: OnboardingRepository) {
        self.onboardingRepository = onboardingRepository
    }
    
    func login(email: String, password: String) -> Observable<Bool> {
        onboardingRepository.login(request: .init(email: email, password: password))
            .asObservable()
            .withUnretained(self)
            .map { owner, response in
                log.debug("log here",value: response)
                let tk = TokenUtils()
                tk.create("accessToken", account: "accessToken", value: response.accessToken)
                tk.create("refreshToken", account: "refreshToken", value: response.refreshToken)
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
    
    // 패스워드
    func validatePassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,16}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: self)
    }
    
}
