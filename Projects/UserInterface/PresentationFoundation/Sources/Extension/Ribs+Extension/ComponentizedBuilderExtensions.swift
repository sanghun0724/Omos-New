//
//  ComponentizedBuilderExtensions.swift
//  omos
//
//  Created by sangheon on 2023/05/23.
//

import RIBs

// MARK: - DynamicBuildComponentizedBuilder

public extension ComponentizedBuilder where DynamicComponentDependency == Void {
  final func build(
    with dynamicBuildDependency: DynamicBuildDependency
  ) -> Router {
    return self.build(
      withDynamicBuildDependency: dynamicBuildDependency,
      dynamicComponentDependency: Void()
    )
  }
}

// MARK: - DynamicComponentizedBuilder

public extension ComponentizedBuilder where DynamicBuildDependency == Void {
  final func build(
    with dynamicComponentDependency: DynamicComponentDependency
  ) -> Router {
    return self.build(
      withDynamicBuildDependency: Void(),
      dynamicComponentDependency: dynamicComponentDependency
    )
  }
}


