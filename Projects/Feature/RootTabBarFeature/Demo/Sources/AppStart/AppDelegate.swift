import UIKit

import NeedleFoundation
import RIBs

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var launchRouter: LaunchRouting?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        registerProviderFactories()
    
        return true
    }
}
