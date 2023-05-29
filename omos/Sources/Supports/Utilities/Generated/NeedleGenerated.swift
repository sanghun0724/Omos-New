

import NeedleFoundation
import RIBs

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class AppRootDependency9fafbf379aae0424b417Provider: AppRootDependency {


    init() {

    }
}
/// ^->AppComponent->AppRootComponent
private func factorya90cb427e52e03443c85e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AppRootDependency9fafbf379aae0424b417Provider()
}
private class TodayDependencye8b9e53f6319ce1bda30Provider: TodayDependency {


    init() {

    }
}
/// ^->AppComponent->AppRootComponent->LoggedInComponent->TodayComponent
private func factoryd6273f0efcff70a3a118e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return TodayDependencye8b9e53f6319ce1bda30Provider()
}
private class SignUpDependency0bf34c242a7f1d630afcProvider: SignUpDependency {


    init() {

    }
}
/// ^->AppComponent->AppRootComponent->LoggedInComponent->SignUpComponent
private func factory5f472eb0e54edab942a0e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignUpDependency0bf34c242a7f1d630afcProvider()
}
private class LoggedInDependency10f17122804ef957cbfbProvider: LoggedInDependency {


    init() {

    }
}
/// ^->AppComponent->AppRootComponent->LoggedInComponent
private func factory2e97267aa2f82879e903e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LoggedInDependency10f17122804ef957cbfbProvider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {


    }
}
extension AppRootComponent: Registration {
    public func registerItems() {


    }
}
extension TodayComponent: Registration {
    public func registerItems() {

    }
}
extension SignUpComponent: Registration {
    public func registerItems() {

    }
}
extension LoggedInComponent: Registration {
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
    registerProviderFactory("^->AppComponent->AppRootComponent", factorya90cb427e52e03443c85e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->AppRootComponent->LoggedInComponent->TodayComponent", factoryd6273f0efcff70a3a118e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->AppRootComponent->LoggedInComponent->SignUpComponent", factory5f472eb0e54edab942a0e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->AppRootComponent->LoggedInComponent", factory2e97267aa2f82879e903e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
