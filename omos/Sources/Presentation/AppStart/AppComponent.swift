//
//  AppComponent.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import NeedleFoundation

// MARK: AppComponent

final class AppComponent: BootstrapComponent ,AppRootDependency {
    var appRootBuilder: AppRootBuildable {
        AppRootBuilder {
            AppRootComponent(parent: self)
        }
    }
    
    var onboardIngRepositoryService: OnboardingRespositoryService {
        shared {
            OnboardingRespositoryServiceImpl(
                onboardingRepository: onboardingRepository
            )
        }
    }
}

extension AppComponent {
    private var onboardingRepository: OnboardingRepository {
        OnboardingRepositoryImpl(networkingProvider: Networking())
    }
}
