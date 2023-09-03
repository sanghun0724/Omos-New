

import AppFoundation
import BaseDomain
import CoreKit
import DesignSystem
import MyPageFeatureInterface
import MyRecordFeatureInterface
import NeedleFoundation
import OnboardingDomain
import OnboardingDomainInterface
import OnboardingFeature
import OnboardingFeatureInterface
import RIBs
import RecordDomain
import RecordDomainInterface
import RootTabBarFeature
import RootTabBarFeatureInterface
import TodayFeature
import TodayFeatureInterface

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class AppRootDependency05b97a2a6185110b345fProvider: AppRootDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return onboardingAppComponent.onboardingRepositoryService
    }
    var onboardingBuilder: OnboardingBuildable {
        return onboardingAppComponent.onboardingBuilder
    }
    var passwordBuilder: PasswordBuildable {
        return onboardingAppComponent.passwordBuilder
    }
    var emailSignUpBuilder: EmailSignUpBuildable {
        return onboardingAppComponent.emailSignUpBuilder
    }
    var agreementBuilder: AgreementBuildable {
        return onboardingAppComponent.agreementBuilder
    }
    var nicknameBuilder: NicknameBuildable {
        return onboardingAppComponent.nicknameBuilder
    }
    private let onboardingAppComponent: OnboardingAppComponent
    init(onboardingAppComponent: OnboardingAppComponent) {
        self.onboardingAppComponent = onboardingAppComponent
    }
}
/// ^->OnboardingAppComponent->AppRootComponent
private func factorycdbe70e95036d9fd617022b2783326b32817e16b(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AppRootDependency05b97a2a6185110b345fProvider(onboardingAppComponent: parent1(component) as! OnboardingAppComponent)
}

#else
extension OnboardingAppComponent: Registration {
    public func registerItems() {


    }
}
extension AppRootComponent: Registration {
    public func registerItems() {
        keyPathToName[\AppRootDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
        keyPathToName[\AppRootDependency.onboardingBuilder] = "onboardingBuilder-OnboardingBuildable"
        keyPathToName[\AppRootDependency.passwordBuilder] = "passwordBuilder-PasswordBuildable"
        keyPathToName[\AppRootDependency.emailSignUpBuilder] = "emailSignUpBuilder-EmailSignUpBuildable"
        keyPathToName[\AppRootDependency.agreementBuilder] = "agreementBuilder-AgreementBuildable"
        keyPathToName[\AppRootDependency.nicknameBuilder] = "nicknameBuilder-NicknameBuildable"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->OnboardingAppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->OnboardingAppComponent->AppRootComponent", factorycdbe70e95036d9fd617022b2783326b32817e16b)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
