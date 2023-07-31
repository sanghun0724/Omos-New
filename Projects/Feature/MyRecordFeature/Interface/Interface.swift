// This is for Tuist

import RIBs

// MARK: - MyRecordListener

public protocol MyRecordListener: AnyObject {}

// MARK: - MyRecordRouting

public protocol MyRecordRouting: ViewableRouting {
    
}

// MARK: - MyRecordBuildDependency

public struct MyRecordBuildDependency {
    public let listener: MyRecordListener
    
    public init(listener: MyRecordListener) {
        self.listener = listener
    }
}

// MARK: - MyRecordBuildable

public protocol MyRecordBuildable: Buildable {
    func build(with dynamicBuildDependency: MyRecordBuildDependency) -> MyRecordRouting
}
