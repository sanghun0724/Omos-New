//
//  LoginRepositoryService.swift
//  omos
//
//  Created by sangheon on 2023/05/18.
//
// Domain Service ~= Usecase

import RxSwift

protocol OnboardingRespositoryService {
    func login(email: String, password: String) -> Observable<Bool>
}

class OnboardingRespositoryServiceImpl: OnboardingRespositoryService {
    
    private let onboardingRepository: OnboardingRepository
    
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
            .catchAndReturn(false)
    }
    
}
