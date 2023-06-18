
import RIBs

// MARK: - SignUpListener

/// @mockable
public protocol SignUpListener: AnyObject {
    func detachSignUpRIB()
}

// MARK: - SignUpRouting

/// @mockable
public protocol SignUpRouting: ViewableRouting {
    func attachNicknameRIB()
    func detachNicknameRIB()
}

// MARK: - SignUpBuildDependency

/// @mockable
public struct SignUpBuildDependency {
    public let listener: SignUpListener
    
    public init(listener: SignUpListener) {
        self.listener = listener
    }
}

// MARK: - SignUpBuildable

/// @mockable
public protocol SignUpBuildable: Buildable {
    func build(with dynamicBuildDependency: SignUpBuildDependency) -> SignUpRouting
}

