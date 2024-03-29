//
//  NicknameBuilder.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import NeedleFoundation
import RIBs

import OnboardingDomainInterface
import OnboardingDomain
import OnboardingFeatureInterface
import RootTabBarFeatureInterface

// MARK: - NicknameDependency

public protocol NicknameDependency: NeedleFoundation.Dependency {
    var onboardingRepositoryService: OnboardingRepositoryService { get }
    var rootTabBarBuilder: RootTabBarBuildable { get }
}

// MARK: - NicknameComponent

public final class NicknameComponent: NeedleFoundation.Component<NicknameDependency> {
    fileprivate var initialState: NicknamePresentableState {
        NicknamePresentableState()
    }
}

// MARK: - NicknameBuilder

public final class NicknameBuilder:
    ComponentizedBuilder<NicknameComponent, NicknameRouting, NicknameBuildDependency, Void>,
    NicknameBuildable
{

    override public func build(
      with component: NicknameComponent,
      _ payload: NicknameBuildDependency
    ) -> NicknameRouting {
        let viewController = NicknameViewController()
        let interactor = NicknameInteractor(
            presenter: viewController,
            initialState: component.initialState,
            onboardingRepositoryService: component.onboardingRepositoryService)
        
        interactor.listener = payload.listener
        return NicknameRouter(
         interactor: interactor,
         viewController: viewController,
         rootTabBarBuilder: component.rootTabBarBuilder
        )
    }
}
