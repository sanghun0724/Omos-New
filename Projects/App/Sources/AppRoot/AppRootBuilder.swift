//
//  AppRootBuilder.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import NeedleFoundation
import RIBs

import OnboardingDomainInterface
import TodayFeatureInterface
import OnboardingFeatureInterface
import OnboardingFeature
import OnboardingFeatureInterface
import RootTabBarFeature
import RootTabBarFeatureInterface

protocol AppRootDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
    var rootTabBarBuilder: RootTabBarBuildable { get }
}

final class AppRootComponent: NeedleFoundation.Component<AppRootDependency> {
    var onboardingBuilder: OnboardingBuildable {
        OnboardingBuilder {
            OnboardingComponent(parent: self)
        }
    }
    
    var nicknameBuilder: NicknameBuildable {
        NicknameBuilder {
            NicknameComponent(parent: self)
        }
    }
    
    var loggedInBuilder: LoggedInBuildable {
        LoggedInBuilder {
            LoggedInComponent(parent: self)
        }
    }
    
    var emailSignUpBuilder: EmailSignUpBuildable {
        EmailSignUpBuilder {
            EmailSignUpComponent(parent: self)
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

// MARK: - Builder

protocol AppRootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class AppRootBuilder:
    SimpleComponentizedBuilder<AppRootComponent, LaunchRouting>,
    AppRootBuildable
{

    override func build(with component: AppRootComponent) -> LaunchRouting {
        let viewController = AppRootViewController()
        let interactor = AppRootInteractor(presenter: viewController)
        
        return AppRootRouter(
            interactor: interactor,
            viewController: viewController,
            onboardingBuilder: component.onboardingBuilder,
            rootTabBarBuilder: component.rootTabBarBuilder
            )
    }
}
