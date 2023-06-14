

import NeedleFoundation
import RIBs

import OnboardingDomain
import SignUpFeature
import LoggedInFeature
import TodayFeature

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

private func parent2(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent
}

private func parent3(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent.parent
}

private func parent4(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent.parent.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class AppRootDependency9fafbf379aae0424b417Provider: AppRootDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
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
private class TodayDependencye8b9e53f6319ce1bda30Provider: TodayDependency {


    init() {

    }
}
/// ^->AppComponent->AppRootComponent->LoggedInComponent->TodayComponent
private func factoryd6273f0efcff70a3a118e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return TodayDependencye8b9e53f6319ce1bda30Provider()
}
private class NicknameDependency63ceb1589b5d77bf2faaProvider: NicknameDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AppRootComponent->LoggedInComponent->SignUpComponent->NicknameComponent
private func factoryae4818ff2be45df533d77586110118823dea9ff0(_ component: NeedleFoundation.Scope) -> AnyObject {
    return NicknameDependency63ceb1589b5d77bf2faaProvider(appComponent: parent4(component) as! AppComponent)
}
private class SignUpDependency0bf34c242a7f1d630afcProvider: SignUpDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AppRootComponent->LoggedInComponent->SignUpComponent
private func factory5f472eb0e54edab942a0b2702fa908b4cedb8464(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignUpDependency0bf34c242a7f1d630afcProvider(appComponent: parent3(component) as! AppComponent)
}
private class LoggedInDependency10f17122804ef957cbfbProvider: LoggedInDependency {
    var onboardingRepositoryService: OnboardingRepositoryService {
        return appComponent.onboardingRepositoryService
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AppRootComponent->LoggedInComponent
private func factory2e97267aa2f82879e903b7304b634b3e62c64b3c(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LoggedInDependency10f17122804ef957cbfbProvider(appComponent: parent2(component) as! AppComponent)
}

#else
extension AppComponent: Registration {
    public func registerItems() {


    }
}
extension AppRootComponent: Registration {
    public func registerItems() {
        keyPathToName[\AppRootDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"

    }
}
extension TodayComponent: Registration {
    public func registerItems() {

    }
}
extension NicknameComponent: Registration {
    public func registerItems() {
        keyPathToName[\NicknameDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
    }
}
extension SignUpComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignUpDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"

    }
}
extension LoggedInComponent: Registration {
    public func registerItems() {
        keyPathToName[\LoggedInDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"

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
    registerProviderFactory("^->AppComponent->AppRootComponent->LoggedInComponent->TodayComponent", factoryd6273f0efcff70a3a118e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->AppRootComponent->LoggedInComponent->SignUpComponent->NicknameComponent", factoryae4818ff2be45df533d77586110118823dea9ff0)
    registerProviderFactory("^->AppComponent->AppRootComponent->LoggedInComponent->SignUpComponent", factory5f472eb0e54edab942a0b2702fa908b4cedb8464)
    registerProviderFactory("^->AppComponent->AppRootComponent->LoggedInComponent", factory2e97267aa2f82879e903b7304b634b3e62c64b3c)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
