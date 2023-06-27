//
//
//import CoreKit
//import NeedleFoundation
//import OnboardingDomain
//import OnboardingDomainInterface
//import OnboardingFeature
//import OnboardingFeatureInterface
//import RIBs
//
//// swiftlint:disable unused_declaration
//private let needleDependenciesHash: String? = nil
//
//// MARK: - Traversal Helpers
//
//private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
//    return component.parent
//}
//
//// MARK: - Providers
//
//#if !NEEDLE_DYNAMIC
//
//    private class AppRootDependency9fafbf379aae0424b417Provider: AppRootDependency {
//        var onboardingRepositoryService: OnboardingRepositoryService {
//            return appComponent.onboardingRepositoryService
//        }
//
//        var onboardingBuilder: OnboardingBuildable {
//            return appComponent.onboardingBuilder
//        }
//
//        private let appComponent: AppComponent
//        init(appComponent: AppComponent) {
//            self.appComponent = appComponent
//        }
//    }
//
//    /// ^->AppComponent->AppRootComponent
//    private func factorya90cb427e52e03443c85f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
//        return AppRootDependency9fafbf379aae0424b417Provider(appComponent: parent1(component) as! AppComponent)
//    }
//
//    private class OnboardingDependencyf77d0055983a00cf8835Provider: OnboardingDependency {
//        init() {}
//    }
//
//    /// ^->AppComponent->OnboardingComponent
//    private func factory88dc13cc29c5719e2b01e3b0c44298fc1c149afb(_: NeedleFoundation.Scope) -> AnyObject {
//        return OnboardingDependencyf77d0055983a00cf8835Provider()
//    }
//
//    private class LoggedInDependencyc7668df81df1c0bef5b1Provider: LoggedInDependency {
//        var onboardingRepositoryService: OnboardingRepositoryService {
//            return appComponent.onboardingRepositoryService
//        }
//
//        var loggedInBuilder: LoggedInBuildable {
//            return appComponent.loggedInBuilder
//        }
//
//        var signUpBulder: SignUpBuildable {
//            return appComponent.signUpBulder
//        }
//
//        var todayBuilder: TodayBuildable {
//            return appComponent.todayBuilder
//        }
//
//        private let appComponent: AppComponent
//        init(appComponent: AppComponent) {
//            self.appComponent = appComponent
//        }
//    }
//
//    /// ^->AppComponent->LoggedInComponent
//    private func factorybe3fbfd42f44e2df6537f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
//        return LoggedInDependencyc7668df81df1c0bef5b1Provider(appComponent: parent1(component) as! AppComponent)
//    }
//
//    private class NicknameDependencyf8931c25a2fc8a703ee7Provider: NicknameDependency {
//        var onboardingRepositoryService: OnboardingRepositoryService {
//            return appComponent.onboardingRepositoryService
//        }
//
//        private let appComponent: AppComponent
//        init(appComponent: AppComponent) {
//            self.appComponent = appComponent
//        }
//    }
//
//    /// ^->AppComponent->NicknameComponent
//    private func factoryefd4cb58dce6be7a9de5f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
//        return NicknameDependencyf8931c25a2fc8a703ee7Provider(appComponent: parent1(component) as! AppComponent)
//    }
//
//    private class SignUpDependencyf83ac0c64026320e6dc2Provider: SignUpDependency {
//        var onboardingRepositoryService: OnboardingRepositoryService {
//            return appComponent.onboardingRepositoryService
//        }
//
//        var nicknameBuilder: NicknameBuildable {
//            return appComponent.nicknameBuilder
//        }
//
//        private let appComponent: AppComponent
//        init(appComponent: AppComponent) {
//            self.appComponent = appComponent
//        }
//    }
//
//    /// ^->AppComponent->SignUpComponent
//    private func factory306e8ce5cfdf41304709f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
//        return SignUpDependencyf83ac0c64026320e6dc2Provider(appComponent: parent1(component) as! AppComponent)
//    }
//
//    private class TodayDependency18dcebc0d3df0c401f0dProvider: TodayDependency {
//        init() {}
//    }
//
//    /// ^->AppComponent->TodayComponent
//    private func factory1ffc93d9a05b4e8720cae3b0c44298fc1c149afb(_: NeedleFoundation.Scope) -> AnyObject {
//        return TodayDependency18dcebc0d3df0c401f0dProvider()
//    }
//
//#else
//    extension AppComponent: Registration {
//        public func registerItems() {}
//    }
//
//    extension AppRootComponent: Registration {
//        public func registerItems() {
//            keyPathToName[\AppRootDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
//            keyPathToName[\AppRootDependency.onboardingBuilder] = "onboardingBuilder-OnboardingBuildable"
//        }
//    }
//
//    extension OnboardingComponent: Registration {
//        public func registerItems() {}
//    }
//
//    extension LoggedInComponent: Registration {
//        public func registerItems() {
//            keyPathToName[\LoggedInDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
//            keyPathToName[\LoggedInDependency.loggedInBuilder] = "loggedInBuilder-LoggedInBuildable"
//            keyPathToName[\LoggedInDependency.signUpBulder] = "signUpBulder-SignUpBuildable"
//            keyPathToName[\LoggedInDependency.todayBuilder] = "todayBuilder-TodayBuildable"
//        }
//    }
//
//    extension NicknameComponent: Registration {
//        public func registerItems() {
//            keyPathToName[\NicknameDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
//        }
//    }
//
//    extension SignUpComponent: Registration {
//        public func registerItems() {
//            keyPathToName[\SignUpDependency.onboardingRepositoryService] = "onboardingRepositoryService-OnboardingRepositoryService"
//            keyPathToName[\SignUpDependency.nicknameBuilder] = "nicknameBuilder-NicknameBuildable"
//        }
//    }
//
//    extension TodayComponent: Registration {
//        public func registerItems() {}
//    }
//
//#endif
//
//private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
//    return EmptyDependencyProvider(component: component)
//}
//
//// MARK: - Registration
//
//private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
//    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
//}
//
//#if !NEEDLE_DYNAMIC
//
//    @inline(never) private func register1() {
//        registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
//        registerProviderFactory("^->AppComponent->AppRootComponent", factorya90cb427e52e03443c85f47b58f8f304c97af4d5)
//        registerProviderFactory("^->AppComponent->OnboardingComponent", factory88dc13cc29c5719e2b01e3b0c44298fc1c149afb)
//        registerProviderFactory("^->AppComponent->LoggedInComponent", factorybe3fbfd42f44e2df6537f47b58f8f304c97af4d5)
//        registerProviderFactory("^->AppComponent->NicknameComponent", factoryefd4cb58dce6be7a9de5f47b58f8f304c97af4d5)
//        registerProviderFactory("^->AppComponent->SignUpComponent", factory306e8ce5cfdf41304709f47b58f8f304c97af4d5)
//        registerProviderFactory("^->AppComponent->TodayComponent", factory1ffc93d9a05b4e8720cae3b0c44298fc1c149afb)
//    }
//#endif
//
//public func registerProviderFactories() {
//    #if !NEEDLE_DYNAMIC
//        register1()
//    #endif
//}
