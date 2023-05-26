//
//  AppRootBuilder.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import NeedleFoundation
import RIBs

protocol AppRootDependency: NeedleFoundation.Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class AppRootComponent: NeedleFoundation.Component<AppRootDependency> {
    fileprivate var loggedInBuilder: LoggedInBuildable {
        LoggedInBuilder {
            LoggedInComponent(parent: self)
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
            loggedInBuilder: component.loggedInBuilder
            )
    }
}
