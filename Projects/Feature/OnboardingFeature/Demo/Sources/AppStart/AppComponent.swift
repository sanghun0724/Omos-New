//
//  AppComponent.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import NeedleFoundation

import CoreKit
import OnboardingDomain
import OnboardingDomainInterface
import OnboardingFeature
import OnboardingFeatureInterface
import TodayFeature
import TodayFeatureInterface

// MARK: AppComponent

final class AppComponent: BootstrapComponent, AppRootDependency {
    
    var appRootBuilder: AppRootBuildable {
        AppRootBuilder {
            AppRootComponent(parent: self)
        }
    }
    
    var onboardingRepositoryService: OnboardingRepositoryService {
        shared {
            OnboardingRespositoryServiceImpl(
                onboardingRepository: onboardingRepository
            )
        }
    }
    
    var onboardingBuilder: OnboardingBuildable {
        OnboardingBuilder {
            OnboardingComponent(parent: self)
        }
    }
    
    var loggedInBuilder: LoggedInBuildable {
        LoggedInBuilder {
            LoggedInComponent(parent: self)
        }
    }
    
    var signUpBuilder: SignUpBuildable {
        SignUpBuilder {
            SignUpComponent(parent: self)
        }
    }
    
    var nicknameBuilder: NicknameBuildable {
        NicknameBuilder {
            NicknameComponent(parent: self)
        }
    }
    
    var todayBuilder: TodayBuildable {
        TodayBuilder {
            TodayComponent(parent: self)
        }
    }
}

extension AppComponent {
    private var onboardingRepository: OnboardingRepository {
        OnboardingRepositoryImpl(networkingProvider: Networking())
    }
}
