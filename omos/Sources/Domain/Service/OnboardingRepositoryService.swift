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
        return Observable.create { [weak self] observer in
            guard let _self = self else { return }
//            _self.onboardingRepository.login(request: .init(email: email, password: password))
//                .bind(with: self, onNext: { owner, res in
//                    <#Some..#>
//                })
//                .disposed(by: disposeBag)
        }
            
    }
    
}
