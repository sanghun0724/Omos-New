//
//  AppComponent.swift
//  RootTabBarFeatureDemoApp
//
//  Created by 이상헌 on 2023/09/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import NeedleFoundation

import RootTabBarFeature
import RootTabBarFeatureInterface

final class AppComponent: BootstrapComponent, AppRootDependency {
    
    var appRootBuilder: AppRootBuildable {
        AppRootBuilder {
            AppRootComponent(parent: self)
        }
    }
    
    var rootTabBarBuilder: RootTabBarBuildable {
        RootTabBarBuilder {
            RootTabBarComponent(parent: self)
        }
    }
}
