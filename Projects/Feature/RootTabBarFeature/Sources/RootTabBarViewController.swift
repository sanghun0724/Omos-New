//
//  RootTabBarViewController.swift
//  RootTabBarFeature
//
//  Created by 이상헌 on 2023/07/23.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

import RIBs

import RootTabBarFeatureInterface

protocol AppRootPresentableListener: AnyObject {
  
}

final class RootTabBarController: UITabBarController, RootTabBarViewControllable, RootTabBarPresentable {
  weak var listener: RootTabBarListener?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tabBar.isTranslucent = false
    tabBar.tintColor = .black
    tabBar.backgroundColor = .white
  }
  
  func setViewControllers(_ viewControllers: [ViewControllable]) {
    super.setViewControllers(viewControllers.map(\.uiviewController), animated: false)
  }
}
