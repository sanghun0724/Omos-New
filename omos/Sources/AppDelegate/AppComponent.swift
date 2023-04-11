//
//  AppComponent.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import Foundation
import ModernRIBs

final class AppComponent: Component<EmptyDependency>, AppRootDependency {
  
  init() {
    super.init(dependency: EmptyComponent())
  }
  
}
