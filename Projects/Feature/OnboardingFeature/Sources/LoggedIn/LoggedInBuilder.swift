//
//  LoggedInBuilder.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import NeedleFoundation
import RIBs

import OnboardingDomainInterface
import TodayFeatureInterface
import OnboardingFeatureInterface

// MARK: - LoggedInDependency

public protocol LoggedInDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
    var loggedInBuilder: LoggedInBuildable { get }
    var signUpBuilder: SignUpBuildable { get }
    var todayBuilder: TodayBuildable { get }
}

// MARK: - DynamicComponentDependency

public typealias LoggedInComponentDependency = Void

// MARK: - LoggedInComponent

public final class LoggedInComponent: NeedleFoundation.Component<LoggedInDependency> {}

// MARK: - LoggedInBuilder

public final class LoggedInBuilder:
    ComponentizedBuilder<
      LoggedInComponent,
      LoggedInRouting,
      LoggedInBuildDependency,
      LoggedInComponentDependency
    >,
    LoggedInBuildable
{
    override public func build(
      with component: LoggedInComponent,
      _ payload: LoggedInBuildDependency
    ) -> LoggedInRouting {
        let viewController = LoggedInViewController()
        let interactor = LoggedInInteractor(presenter: viewController,
                                            initialState: .init(),
                                            onboardingRepositoryService: component.onboardingRepositoryService)
        interactor.listener = payload.listener
        
        return LoggedInRouter(todayBuilder: component.todayBuilder,
                              signUpBuilder: component.signUpBuilder,
                              interactor: interactor,
                              viewController: viewController)
    }
}
