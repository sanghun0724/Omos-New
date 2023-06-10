//
//  NicknameBuilder.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import NeedleFoundation
import RIBs

// MARK: - NicknameDependency

protocol NicknameDependency: NeedleFoundation.Dependency {}

// MARK: - NicknameBuildDependency

struct NicknameBuildDependency {
    let listener: NicknameListener
}

// MARK: - NicknameComponent

final class NicknameComponent: NeedleFoundation.Component<NicknameDependency> {
    fileprivate var initialState: NicknamePresentableState {
        NicknamePresentableState()
    }
}

// MARK: - NicknameBuildable

protocol NicknameBuildable: Buildable {
    func build(with dynamicBuildDependency: NicknameBuildDependency) -> NicknameRouting
}

// MARK: - NicknameBuilder

final class NicknameBuilder:
    ComponentizedBuilder<NicknameComponent, NicknameRouting, NicknameBuildDependency, Void>,
    NicknameBuildable
{

    override func build(
      with component: NicknameComponent,
      _ payload: NicknameBuildDependency
    ) -> NicknameRouting {
        let viewController = NicknameViewController()
        let interactor = NicknameInteractor(presenter: viewController, initialState: component.initialState)
        
        interactor.listener = payload.listener
        return NicknameRouter(interactor: interactor, viewController: viewController)
    }
}
