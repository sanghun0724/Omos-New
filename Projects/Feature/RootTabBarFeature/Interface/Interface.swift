// This is for Tuist

import RIBs

// MARK: - RootTabBarRouting

public protocol RootTabBarRouting: ViewableRouting {
    func attachTabs()
}


// MARK: - RootTabBarListener

public protocol RootTabBarListener: AnyObject {}

// MARK: - RootTabBarBuildDependency

public struct RootTabBarBuildDependency {
   public let listener: RootTabBarListener
    
    public init(listener: RootTabBarListener) {
        self.listener = listener
    }
}

// MARK: - RootTabBarBuildable

public protocol RootTabBarBuildable: Buildable {
    func build(with dynamicBuildDependency: RootTabBarBuildDependency) -> RootTabBarRouting
}
