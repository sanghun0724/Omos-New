//
//  LoggedInBuilder.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import NeedleFoundation
import RIBs

// MARK: - LoggedInDependency

protocol LoggedInDependency: NeedleFoundation.Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

// MARK: - LoggedInComponent

final class LoggedInComponent: NeedleFoundation.Component<LoggedInDependency> {
    fileprivate var todayBuilder: TodayBuildable {
      TodayBuilder {
        TodayComponent(parent: self)
      }
    }
}

// MARK: - LoggedInBuildDependency

struct LoggedInBuildDependency {
    let listener: LoggedInListener
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(with dynamicBuildDependency: LoggedInBuildDependency) -> LoggedInRouting
}

// MARK: - LoggedInBuilder

final class LoggedInBuilder:
    ComponentizedBuilder<LoggedInComponent, LoggedInRouting, LoggedInBuildDependency, Void>,
    LoggedInBuildable {

    override func build(
      with component: LoggedInComponent,
      _ payload: LoggedInBuildDependency
    ) -> LoggedInRouting {
        let viewController = LoggedInViewController()
        let interactor = LoggedInInteractor(presenter: viewController,
                                            initialState: .init(),
                                            onboardingRepositoryService: OnboardingRespositoryServiceImpl(onboardingRepository: OnboardingRepositoryImpl(networkingProvider: Networking())))
        interactor.listener = payload.listener
        
        return LoggedInRouter(todayBuilder: component.todayBuilder,
                              interactor: interactor,
                              viewController: viewController)
    }
}
