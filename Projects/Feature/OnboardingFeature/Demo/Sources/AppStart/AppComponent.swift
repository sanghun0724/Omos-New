//
//  AppComponent.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import NeedleFoundation

import CoreKit
import BaseDomain
import OnboardingDomain
import OnboardingDomainInterface
import OnboardingFeature
import OnboardingFeatureInterface
import TodayFeature
import TodayFeatureInterface
import RecordDomain
import RecordDomainInterface
import RootTabBarFeature
import RootTabBarFeatureInterface

// MARK: AppComponent

final class OnboardingAppComponent: BootstrapComponent, AppRootDependency {
    
    var appRootBuilder: AppRootBuildable {
        AppRootBuilder {
            AppRootComponent(parent: self)
        }
    }
    
    var rootTabBarBuilder: RootTabBarBuildable {
        RootTabBarBuilder {
            RootTabBarComponent(parent: self)
        }
    }
    
    var onboardingRepositoryService: OnboardingRepositoryService {
        shared {
            OnboardingRepositoryServiceImpl(
                onboardingRepository: onboardingRepository
            )
        }
    }
    
    var onboardingBuilder: OnboardingBuildable {
        OnboardingBuilder {
            OnboardingComponent(parent: self)
        }
    }

    var emailSignUpBuilder: EmailSignUpBuildable {
        EmailSignUpBuilder {
            EmailSignUpComponent(parent: self)
        }
    }
    
    var loggedInBuilder: LoggedInBuildable {
        LoggedInBuilder {
            LoggedInComponent(parent: self)
        }
    }
    
    var nicknameBuilder: NicknameBuildable {
        NicknameBuilder {
            NicknameComponent(parent: self)
        }
    }
    
    var passwordBuilder: PasswordBuildable {
        PasswordBuilder {
            PasswordComponent(parent: self)
        }
    }

    var agreementBuilder: AgreementBuildable {
        AgreementBuilder {
            AgreementComponent(parent: self)
        }
    }
}

extension OnboardingAppComponent {
    private var onboardingRepository: OnboardingRepository {
        OnboardingRepositoryImpl(networkingProvider: Networking())
    }
}
