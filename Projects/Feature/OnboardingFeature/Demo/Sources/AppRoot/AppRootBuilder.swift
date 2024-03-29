//
//  AppRootBuilder.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import NeedleFoundation
import RIBs

import OnboardingDomainInterface
import OnboardingFeatureInterface

protocol AppRootDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
    var onboardingBuilder: OnboardingBuildable { get }
    var passwordBuilder: PasswordBuildable { get }
    var emailSignUpBuilder: EmailSignUpBuildable { get }
    var agreementBuilder: AgreementBuildable { get }
    var nicknameBuilder: NicknameBuildable { get }
}

final class AppRootComponent: NeedleFoundation.Component<AppRootDependency> {}

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
            passwordBuilder: component.passwordBuilder,
            emailSignUpBuilder: component.emailSignUpBuilder,
            agreementBuilder: component.agreementBuilder,
            nicknameBuilder: component.nicknameBuilder
            )
    }
}
