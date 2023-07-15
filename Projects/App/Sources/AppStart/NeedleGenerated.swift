

import AppFoundation
import CoreKit
import NeedleFoundation
import OnboardingDomain
import OnboardingDomainInterface
import OnboardingFeature
import OnboardingFeatureInterface
import RIBs
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

private class AppRootDependency9fafbf379aae0424b417Provider: AppRootDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    var onboardingBuilder: OnboardingBuildable {
        return appComponent.onboardingBuilder
    }
    var todayBuilder: TodayBuildable {
        return appComponent.todayBuilder
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
private class OnboardingDependencyf77d0055983a00cf8835Provider: OnboardingDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    var signUpBuilder: EmailSignUpBuildable {
        return appComponent.signUpBuilder
    }
    var loggedInBuilder: LoggedInBuildable {
        return appComponent.loggedInBuilder
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->OnboardingComponent
private func factory88dc13cc29c5719e2b01f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return OnboardingDependencyf77d0055983a00cf8835Provider(appComponent: parent1(component) as! AppComponent)
}
private class PasswordDependencyfd7427318599b626f4acProvider: PasswordDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->PasswordComponent
private func factory9f8860811946a346ca2af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return PasswordDependencyfd7427318599b626f4acProvider(appComponent: parent1(component) as! AppComponent)
}
private class NicknameDependencyf8931c25a2fc8a703ee7Provider: NicknameDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->NicknameComponent
private func factoryefd4cb58dce6be7a9de5f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NicknameDependencyf8931c25a2fc8a703ee7Provider(appComponent: parent1(component) as! AppComponent)
}
private class EmailSignUpDependency76a7ffa273be1ab5382fProvider: EmailSignUpDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    var passwordBuilder: PasswordBuildable {
        return appComponent.passwordBuilder
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->EmailSignUpComponent
private func factory792b7e64953807cbfaf8f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmailSignUpDependency76a7ffa273be1ab5382fProvider(appComponent: parent1(component) as! AppComponent)
}
private class LoggedInDependencyc7668df81df1c0bef5b1Provider: LoggedInDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    var loggedInBuilder: LoggedInBuildable {
        return appComponent.loggedInBuilder
    }
    var signUpBuilder: EmailSignUpBuildable {
        return appComponent.signUpBuilder
    }
    var todayBuilder: TodayBuildable {
        return appComponent.todayBuilder
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->LoggedInComponent
private func factorybe3fbfd42f44e2df6537f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LoggedInDependencyc7668df81df1c0bef5b1Provider(appComponent: parent1(component) as! AppComponent)
}
private class TodayDependency18dcebc0d3df0c401f0dProvider: TodayDependency {


    init() {

    }
}
/// ^->AppComponent->TodayComponent
private func factory1ffc93d9a05b4e8720cae3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return TodayDependency18dcebc0d3df0c401f0dProvider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {


    }
}
extension AppRootComponent: Registration {
    public func registerItems() {
        keyPathToName[\AppRootDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
        keyPathToName[\AppRootDependency.onboardingBuilder] = "onboardingBuilder-OnboardingBuildable"
        keyPathToName[\AppRootDependency.todayBuilder] = "todayBuilder-TodayBuildable"
    }
}
extension OnboardingComponent: Registration {
    public func registerItems() {
        keyPathToName[\OnboardingDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
        keyPathToName[\OnboardingDependency.signUpBuilder] = "signUpBuilder-EmailSignUpBuildable"
        keyPathToName[\OnboardingDependency.loggedInBuilder] = "loggedInBuilder-LoggedInBuildable"
    }
}
extension PasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\PasswordDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
    }
}
extension NicknameComponent: Registration {
    public func registerItems() {
        keyPathToName[\NicknameDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
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
        keyPathToName[\LoggedInDependency.signUpBuilder] = "signUpBuilder-EmailSignUpBuildable"
        keyPathToName[\LoggedInDependency.todayBuilder] = "todayBuilder-TodayBuildable"
    }
}
extension TodayComponent: Registration {
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
    registerProviderFactory("^->AppComponent->OnboardingComponent", factory88dc13cc29c5719e2b01f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->PasswordComponent", factory9f8860811946a346ca2af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->NicknameComponent", factoryefd4cb58dce6be7a9de5f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->EmailSignUpComponent", factory792b7e64953807cbfaf8f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->LoggedInComponent", factorybe3fbfd42f44e2df6537f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->TodayComponent", factory1ffc93d9a05b4e8720cae3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
