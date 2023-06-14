//
//  LoggedInBuilder.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import PresentationFoundation
import OnboardingDomain
import TodayFeature
import SignUpFeature
import LoggedInFeatureInterface

import NeedleFoundation
import RIBs

// MARK: - LoggedInDependency

public protocol LoggedInDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
}

// MARK: - DynamicComponentDependency

public typealias LoggedInComponentDependency = Void

// MARK: - LoggedInComponent

public final class LoggedInComponent: NeedleFoundation.Component<LoggedInDependency> {
    fileprivate var todayBuilder: TodayBuildable {
      TodayBuilder {
        TodayComponent(parent: self)
      }
    }
    
    fileprivate var signUpBulder: SignUpBuildable {
        SignUpBuilder {
            SignUpComponent(parent: self)
        }
    }
}

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
