

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

private func parent2(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class AppRootDependency9fafbf379aae0424b417Provider: AppRootDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    var rootTabBarBuilder: RootTabBarBuildable {
        return appComponent.rootTabBarBuilder
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AppRootComponent
private func factorya90cb427e52e03443c85f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AppRootDependency9fafbf379aae0424b417Provider(appComponent: parent1(component) as! AppComponent)
}
private class OnboardingDependency5878aee2fd49eefb12eaProvider: OnboardingDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    var emailSignUpBuilder: EmailSignUpBuildable {
        return appRootComponent.emailSignUpBuilder
    }
    var loggedInBuilder: LoggedInBuildable {
        return appRootComponent.loggedInBuilder
    }
    var agreementBuilder: AgreementBuildable {
        return appRootComponent.agreementBuilder
    }
    var rootTabBarBuilder: RootTabBarBuildable {
        return appComponent.rootTabBarBuilder
    }
    private let appComponent: AppComponent
    private let appRootComponent: AppRootComponent
    init(appComponent: AppComponent, appRootComponent: AppRootComponent) {
        self.appComponent = appComponent
        self.appRootComponent = appRootComponent
    }
}
/// ^->AppComponent->AppRootComponent->OnboardingComponent
private func factoryd8397a11029373978f1bb0aebae058fa90f691ca(_ component: NeedleFoundation.Scope) -> AnyObject {
    return OnboardingDependency5878aee2fd49eefb12eaProvider(appComponent: parent2(component) as! AppComponent, appRootComponent: parent1(component) as! AppRootComponent)
}
private class PasswordDependency9b9804da08f754b97e0cProvider: PasswordDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    var agreementBuilder: AgreementBuildable {
        return appRootComponent.agreementBuilder
    }
    private let appComponent: AppComponent
    private let appRootComponent: AppRootComponent
    init(appComponent: AppComponent, appRootComponent: AppRootComponent) {
        self.appComponent = appComponent
        self.appRootComponent = appRootComponent
    }
}
/// ^->AppComponent->AppRootComponent->PasswordComponent
private func factory9598ef7199825e97f91cb0aebae058fa90f691ca(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordDependency9b9804da08f754b97e0cProvider(appComponent: parent2(component) as! AppComponent, appRootComponent: parent1(component) as! AppRootComponent)
}
private class AgreementDependencya3ce61175f17e3227b25Provider: AgreementDependency {
    var nicknameBuilder: NicknameBuildable {
        return appRootComponent.nicknameBuilder
    }
    private let appRootComponent: AppRootComponent
    init(appRootComponent: AppRootComponent) {
        self.appRootComponent = appRootComponent
    }
}
/// ^->AppComponent->AppRootComponent->AgreementComponent
private func factoryfb1da73769c20bb7fc56299ff67c388cfa43a07e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AgreementDependencya3ce61175f17e3227b25Provider(appRootComponent: parent1(component) as! AppRootComponent)
}
private class NicknameDependency9277ba96be20969bdacbProvider: NicknameDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    var rootTabBarBuilder: RootTabBarBuildable {
        return appComponent.rootTabBarBuilder
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AppRootComponent->NicknameComponent
private func factory75bd9e090bc284c261b4b7304b634b3e62c64b3c(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NicknameDependency9277ba96be20969bdacbProvider(appComponent: parent2(component) as! AppComponent)
}
private class EmailSignUpDependency976fdebff01e4a9fdc82Provider: EmailSignUpDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    var passwordBuilder: PasswordBuildable {
        return appRootComponent.passwordBuilder
    }
    private let appComponent: AppComponent
    private let appRootComponent: AppRootComponent
    init(appComponent: AppComponent, appRootComponent: AppRootComponent) {
        self.appComponent = appComponent
        self.appRootComponent = appRootComponent
    }
}
/// ^->AppComponent->AppRootComponent->EmailSignUpComponent
private func factory87b8b8eef6732e4a2df8b0aebae058fa90f691ca(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmailSignUpDependency976fdebff01e4a9fdc82Provider(appComponent: parent2(component) as! AppComponent, appRootComponent: parent1(component) as! AppRootComponent)
}
private class LoggedInDependency10f17122804ef957cbfbProvider: LoggedInDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    var loggedInBuilder: LoggedInBuildable {
        return appRootComponent.loggedInBuilder
    }
    var emailSignUpBuilder: EmailSignUpBuildable {
        return appRootComponent.emailSignUpBuilder
    }
    var rootTabBarBuilder: RootTabBarBuildable {
        return appComponent.rootTabBarBuilder
    }
    private let appComponent: AppComponent
    private let appRootComponent: AppRootComponent
    init(appComponent: AppComponent, appRootComponent: AppRootComponent) {
        self.appComponent = appComponent
        self.appRootComponent = appRootComponent
    }
}
/// ^->AppComponent->AppRootComponent->LoggedInComponent
private func factory2e97267aa2f82879e903b0aebae058fa90f691ca(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LoggedInDependency10f17122804ef957cbfbProvider(appComponent: parent2(component) as! AppComponent, appRootComponent: parent1(component) as! AppRootComponent)
}
private class TodayDependency5c5660892d15e89bb87aProvider: TodayDependency {


    init() {

    }
}
/// ^->AppComponent->RootTabBarComponent->TodayComponent
private func factory0cd999a7a5ec6a53d471e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return TodayDependency5c5660892d15e89bb87aProvider()
}
private class RootTabBarDependencyb4448a5cad7d9b910403Provider: RootTabBarDependency {


    init() {

    }
}
/// ^->AppComponent->RootTabBarComponent
private func factory63a72f654f552fbe310ee3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootTabBarDependencyb4448a5cad7d9b910403Provider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {


    }
}
extension AppRootComponent: Registration {
    public func registerItems() {
        keyPathToName[\AppRootDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
        keyPathToName[\AppRootDependency.rootTabBarBuilder] = "rootTabBarBuilder-RootTabBarBuildable"

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
extension TodayComponent: Registration {
    public func registerItems() {

    }
}
extension RootTabBarComponent: Registration {
    public func registerItems() {


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
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->AppRootComponent", factorya90cb427e52e03443c85f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AppRootComponent->OnboardingComponent", factoryd8397a11029373978f1bb0aebae058fa90f691ca)
    registerProviderFactory("^->AppComponent->AppRootComponent->PasswordComponent", factory9598ef7199825e97f91cb0aebae058fa90f691ca)
    registerProviderFactory("^->AppComponent->AppRootComponent->AgreementComponent", factoryfb1da73769c20bb7fc56299ff67c388cfa43a07e)
    registerProviderFactory("^->AppComponent->AppRootComponent->NicknameComponent", factory75bd9e090bc284c261b4b7304b634b3e62c64b3c)
    registerProviderFactory("^->AppComponent->AppRootComponent->EmailSignUpComponent", factory87b8b8eef6732e4a2df8b0aebae058fa90f691ca)
    registerProviderFactory("^->AppComponent->AppRootComponent->LoggedInComponent", factory2e97267aa2f82879e903b0aebae058fa90f691ca)
    registerProviderFactory("^->AppComponent->RootTabBarComponent->TodayComponent", factory0cd999a7a5ec6a53d471e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->RootTabBarComponent", factory63a72f654f552fbe310ee3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
