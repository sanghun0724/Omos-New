

import NeedleFoundation
import OnboardingDomain
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
        keyPathToName[\AppRootDependency.todayBuilder] = "todayBuilder-TodayBuildable"
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
    registerProviderFactory("^->AppComponent->TodayComponent", factory1ffc93d9a05b4e8720cae3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
