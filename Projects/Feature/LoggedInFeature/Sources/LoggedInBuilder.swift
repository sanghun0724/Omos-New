//
//  LoggedInBuilder.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import NeedleFoundation
import RIBs

import OnboardingDomain
import LoggedInFeatureInterface
//import TodayFeature
import TodayFeatureInterface
//import SignUpFeature
import SignUpFeatureInterface

// MARK: - LoggedInDependency

public protocol LoggedInDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
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
                              signUpBuilder: component.signUpBulder,
                              interactor: interactor,
                              viewController: viewController)
    }
}
