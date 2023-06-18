
import RIBs

// MARK: - TodayRouting

/// @mockable
public protocol TodayRouting: ViewableRouting {
    
}

// MARK: - TodayListener

/// @mockable
public protocol TodayListener: AnyObject {}

// MARK: - TodayBuildDependency

/// @mockable
public struct TodayBuildDependency {
    public let listener: TodayListener
    
    public init(listener: TodayListener) {
        self.listener = listener
    }
}

// MARK: - TodayBuildable

/// @mockable
public protocol TodayBuildable: Buildable {
    func build(with dynamicBuildDependency: TodayBuildDependency) -> TodayRouting
}
