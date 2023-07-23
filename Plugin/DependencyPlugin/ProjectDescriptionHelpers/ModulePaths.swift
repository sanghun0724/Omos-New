import Foundation
import ProjectDescription

// swiftlint: disable all
public enum ModulePaths {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case shared(Shared)
    case userInterface(UserInterface)
}

public extension ModulePaths {
    enum Feature: String {
        case MyPageFeature
        case MyDJFeature
        case AllRecordFeature
        case MyRecordFeature
        case RootTabBarFeature
        case TodayFeature
        case OnboardingFeature
        case BaseFeature

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Domain: String {
        case RecordDomain
        case OnboardingDomain
        case BaseDomain

        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Core: String {
        case CoreKit
        
        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum Shared: String {
        case BaseShared
        case DesignSystem
        case AppFoundation
        case GlobalThirdPartyLibrary
        
        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public extension ModulePaths {
    enum UserInterface: String {
        case PresentationFoundation
        case DesignSystem
        
        func targetName(type: MicroTargetType) -> String {
            "\(self.rawValue)\(type.rawValue)"
        }
    }
}

public enum MicroTargetType: String {
    case interface = "Interface"
    case sources = ""
    case testing = "Testing"
}
