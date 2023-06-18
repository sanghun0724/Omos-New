
import RIBs

// MARK: - LoggedInListener

/// @mockable
public protocol LoggedInListener: AnyObject {
    
}

// MARK: - LoggedInRouting

/// @mockable
public protocol LoggedInRouting: ViewableRouting {
    func attachFindRIB()
    func detachFindRIB()
    func attachSignUpRIB()
    func detachSignUpRIB()
    func attachTodayRIB()
    func detachTodayRIB()
}

// MARK: - LoggedInBuildDependency

///@mockable
public struct LoggedInBuildDependency {
    public let listener: LoggedInListener
    
    public init(listener: LoggedInListener) {
        self.listener = listener
    }
}

// MARK: - Builder

/// @mockable
public protocol LoggedInBuildable: Buildable {
    func build(with dynamicBuildDependency: LoggedInBuildDependency) -> LoggedInRouting
}
