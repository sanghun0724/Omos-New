//
//  TodayBuilder.swift
//  omos
//
//  Created by sangheon on 2023/05/23.
//

import NeedleFoundation
import RIBs

// MARK: - TodayDependency

protocol TodayDependency: NeedleFoundation.Dependency {

}

// MARK: - TodayComponent

public final class TodayComponent: NeedleFoundation.Component<TodayDependency> {
    fileprivate var initialState: TodayPresentableState {
        TodayPresentableState()
    }
}

// MARK: - TodayBuilder

public final class TodayBuilder:
    ComponentizedBuilder<TodayComponent, TodayRouting, TodayBuildDependency, Void>,
    TodayBuildable
{
    override func build(
      with component: TodayComponent,
      _ payload: TodayBuildDependency
    ) -> TodayRouting {
        let viewController = TodayViewController()
        let interactor = TodayInteractor(presenter: viewController, initialState: component.initialState)
        
        interactor.listener = payload.listener
        return TodayRouter(interactor: interactor, viewController: viewController)
    }
}
