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
    var onboardingRepositoryService: OnboardingRepositoryService { get }
}

// MARK: - LoggedInComponent

final class LoggedInComponent: NeedleFoundation.Component<LoggedInDependency> {
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
                                            onboardingRepositoryService: component.onboardingRepositoryService)
        interactor.listener = payload.listener
        
        return LoggedInRouter(todayBuilder: component.todayBuilder,
                              signUpBuilder: component.signUpBulder,
                              interactor: interactor,
                              viewController: viewController)
    }
}
