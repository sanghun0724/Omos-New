//
//  AppRootBuilder.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import NeedleFoundation
import RIBs

import OnboardingDomainInterface
import LoggedInFeature
import LoggedInFeatureInterface

protocol AppRootDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
    var loggedInBuilder: LoggedInBuildable { get }
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
            loggedInBuilder: component.loggedInBuilder
            )
    }
}
