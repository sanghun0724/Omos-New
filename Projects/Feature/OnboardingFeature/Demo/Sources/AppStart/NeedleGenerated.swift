

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
private class OnboardingDependency62fdc8b5f8fc15d21ae6Provider: OnboardingDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return onboardingAppComponent.onboardingRepositoryService
    }
    var emailSignUpBuilder: EmailSignUpBuildable {
        return onboardingAppComponent.emailSignUpBuilder
    }
    var loggedInBuilder: LoggedInBuildable {
        return onboardingAppComponent.loggedInBuilder
    }
    var agreementBuilder: AgreementBuildable {
        return onboardingAppComponent.agreementBuilder
    }
    var rootTabBarBuilder: RootTabBarBuildable {
        return onboardingAppComponent.rootTabBarBuilder
    }
    private let onboardingAppComponent: OnboardingAppComponent
    init(onboardingAppComponent: OnboardingAppComponent) {
        self.onboardingAppComponent = onboardingAppComponent
    }
}
/// ^->OnboardingAppComponent->OnboardingComponent
private func factory1ffcc098a94469c7a6c822b2783326b32817e16b(_ component: NeedleFoundation.Scope) -> AnyObject {
    return OnboardingDependency62fdc8b5f8fc15d21ae6Provider(onboardingAppComponent: parent1(component) as! OnboardingAppComponent)
}
private class PasswordDependency8f1a651cf3c945a68ecaProvider: PasswordDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return onboardingAppComponent.onboardingRepositoryService
    }
    var agreementBuilder: AgreementBuildable {
        return onboardingAppComponent.agreementBuilder
    }
    private let onboardingAppComponent: OnboardingAppComponent
    init(onboardingAppComponent: OnboardingAppComponent) {
        self.onboardingAppComponent = onboardingAppComponent
    }
}
/// ^->OnboardingAppComponent->PasswordComponent
private func factoryd2b0826fb81ac30b6b2222b2783326b32817e16b(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordDependency8f1a651cf3c945a68ecaProvider(onboardingAppComponent: parent1(component) as! OnboardingAppComponent)
}
private class AgreementDependency02954f0cd2c92a4ba440Provider: AgreementDependency {
    var nicknameBuilder: NicknameBuildable {
        return onboardingAppComponent.nicknameBuilder
    }
    private let onboardingAppComponent: OnboardingAppComponent
    init(onboardingAppComponent: OnboardingAppComponent) {
        self.onboardingAppComponent = onboardingAppComponent
    }
}
/// ^->OnboardingAppComponent->AgreementComponent
private func factory527ed82a1278f17dd18622b2783326b32817e16b(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AgreementDependency02954f0cd2c92a4ba440Provider(onboardingAppComponent: parent1(component) as! OnboardingAppComponent)
}
private class NicknameDependency77ab70a03e6a2f44fe77Provider: NicknameDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return onboardingAppComponent.onboardingRepositoryService
    }
    var rootTabBarBuilder: RootTabBarBuildable {
        return onboardingAppComponent.rootTabBarBuilder
    }
    private let onboardingAppComponent: OnboardingAppComponent
    init(onboardingAppComponent: OnboardingAppComponent) {
        self.onboardingAppComponent = onboardingAppComponent
    }
}
/// ^->OnboardingAppComponent->NicknameComponent
private func factoryfe840ed0b4043c67e99f22b2783326b32817e16b(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NicknameDependency77ab70a03e6a2f44fe77Provider(onboardingAppComponent: parent1(component) as! OnboardingAppComponent)
}
private class EmailSignUpDependency9530c268d47b3659e206Provider: EmailSignUpDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return onboardingAppComponent.onboardingRepositoryService
    }
    var passwordBuilder: PasswordBuildable {
        return onboardingAppComponent.passwordBuilder
    }
    private let onboardingAppComponent: OnboardingAppComponent
    init(onboardingAppComponent: OnboardingAppComponent) {
        self.onboardingAppComponent = onboardingAppComponent
    }
}
/// ^->OnboardingAppComponent->EmailSignUpComponent
private func factory40a60609e054804fdffa22b2783326b32817e16b(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmailSignUpDependency9530c268d47b3659e206Provider(onboardingAppComponent: parent1(component) as! OnboardingAppComponent)
}
private class LoggedInDependencyea11961202d898204be9Provider: LoggedInDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return onboardingAppComponent.onboardingRepositoryService
    }
    var loggedInBuilder: LoggedInBuildable {
        return onboardingAppComponent.loggedInBuilder
    }
    var emailSignUpBuilder: EmailSignUpBuildable {
        return onboardingAppComponent.emailSignUpBuilder
    }
    var rootTabBarBuilder: RootTabBarBuildable {
        return onboardingAppComponent.rootTabBarBuilder
    }
    private let onboardingAppComponent: OnboardingAppComponent
    init(onboardingAppComponent: OnboardingAppComponent) {
        self.onboardingAppComponent = onboardingAppComponent
    }
}
/// ^->OnboardingAppComponent->LoggedInComponent
private func factory1801007332ff9d45492d22b2783326b32817e16b(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LoggedInDependencyea11961202d898204be9Provider(onboardingAppComponent: parent1(component) as! OnboardingAppComponent)
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
extension OnboardingComponent: Registration {
    public func registerItems() {
        keyPathToName[\OnboardingDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
        keyPathToName[\OnboardingDependency.emailSignUpBuilder] = "emailSignUpBuilder-EmailSignUpBuildable"
        keyPathToName[\OnboardingDependency.loggedInBuilder] = "loggedInBuilder-LoggedInBuildable"
        keyPathToName[\OnboardingDependency.agreementBuilder] = "agreementBuilder-AgreementBuildable"
        keyPathToName[\OnboardingDependency.rootTabBarBuilder] = "rootTabBarBuilder-RootTabBarBuildable"
    }
}
extension PasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\PasswordDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
        keyPathToName[\PasswordDependency.agreementBuilder] = "agreementBuilder-AgreementBuildable"
    }
}
extension AgreementComponent: Registration {
    public func registerItems() {
        keyPathToName[\AgreementDependency.nicknameBuilder] = "nicknameBuilder-NicknameBuildable"
    }
}
extension NicknameComponent: Registration {
    public func registerItems() {
        keyPathToName[\NicknameDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
        keyPathToName[\NicknameDependency.rootTabBarBuilder] = "rootTabBarBuilder-RootTabBarBuildable"
    }
}
extension EmailSignUpComponent: Registration {
    public func registerItems() {
        keyPathToName[\EmailSignUpDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
        keyPathToName[\EmailSignUpDependency.passwordBuilder] = "passwordBuilder-PasswordBuildable"
    }
}
extension LoggedInComponent: Registration {
    public func registerItems() {
        keyPathToName[\LoggedInDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
        keyPathToName[\LoggedInDependency.loggedInBuilder] = "loggedInBuilder-LoggedInBuildable"
        keyPathToName[\LoggedInDependency.emailSignUpBuilder] = "emailSignUpBuilder-EmailSignUpBuildable"
        keyPathToName[\LoggedInDependency.rootTabBarBuilder] = "rootTabBarBuilder-RootTabBarBuildable"
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
    registerProviderFactory("^->OnboardingAppComponent->OnboardingComponent", factory1ffcc098a94469c7a6c822b2783326b32817e16b)
    registerProviderFactory("^->OnboardingAppComponent->PasswordComponent", factoryd2b0826fb81ac30b6b2222b2783326b32817e16b)
    registerProviderFactory("^->OnboardingAppComponent->AgreementComponent", factory527ed82a1278f17dd18622b2783326b32817e16b)
    registerProviderFactory("^->OnboardingAppComponent->NicknameComponent", factoryfe840ed0b4043c67e99f22b2783326b32817e16b)
    registerProviderFactory("^->OnboardingAppComponent->EmailSignUpComponent", factory40a60609e054804fdffa22b2783326b32817e16b)
    registerProviderFactory("^->OnboardingAppComponent->LoggedInComponent", factory1801007332ff9d45492d22b2783326b32817e16b)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
