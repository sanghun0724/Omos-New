// This is for Tuist

import RIBs

// MARK: - MyPageListener

public protocol MyPageListener: AnyObject {}

// MARK: - MyPageRouting

public protocol MyPageRouting: ViewableRouting {
    
}

// MARK: - MyPageBuildDependency

public struct MyPageBuildDependency {
    public let listener: MyPageListener
    
    public init(listener: MyPageListener) {
        self.listener = listener
    }
}

// MARK: - MyPageBuildable

public protocol MyPageBuildable: Buildable {
    func build(with dynamicBuildDependency: MyPageBuildDependency) -> MyPageRouting
}
