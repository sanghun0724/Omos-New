import UIKit

import RIBs

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var launchRouter: LaunchRouting?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)

        self.window = window
    
        setLaunchRouter()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
    
    private func setLaunchRouter() {
        guard let window = self.window else { return }
        let appComponent = OnboardingAppComponent()
        self.launchRouter = appComponent.appRootBuilder.build()
        self.launchRouter?.launch(from: window)
    }
}
