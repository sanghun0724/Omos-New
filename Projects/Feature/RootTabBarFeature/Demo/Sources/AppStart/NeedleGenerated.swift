

import NeedleFoundation
import RIBs
import RootTabBarFeature
import RootTabBarFeatureInterface

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class AppRootDependency9fafbf379aae0424b417Provider: AppRootDependency {
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

#else
extension AppComponent: Registration {
    public func registerItems() {


    }
}
extension AppRootComponent: Registration {
    public func registerItems() {
        keyPathToName[\AppRootDependency.rootTabBarBuilder] = "rootTabBarBuilder-RootTabBarBuildable"
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
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
