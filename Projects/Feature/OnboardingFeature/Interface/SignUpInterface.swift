
import RIBs

// MARK: - SignUpListener

/// @mockable
public protocol EmailSignUpListener: AnyObject {
    func detachSignUpRIB()
}

// MARK: - SignUpRouting

/// @mockable
public protocol EmailSignUpRouting: ViewableRouting {
    func attachPasswordRIB()
    func detachPasswordRIB()
}

// MARK: - SignUpBuildDependency

/// @mockable
public struct EmailSignUpBuildDependency {
    public let listener: EmailSignUpListener
    
    public init(listener: EmailSignUpListener) {
        self.listener = listener
    }
}

// MARK: - SignUpBuildable

/// @mockable
public protocol EmailSignUpBuildable: Buildable {
    func build(with dynamicBuildDependency: EmailSignUpBuildDependency) -> EmailSignUpRouting
}

