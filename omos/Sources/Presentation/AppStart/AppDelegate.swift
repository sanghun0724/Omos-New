//
//  AppDelegate.swift
//  omos
//
//  Created by sangheon on 2023/04/08.
//

import UIKit

import RIBs
import KakaoSDKAuth
import KakaoSDKCommon
import LogFlume

/// import once and use it globally
public typealias Log = LogFlume

@UIApplicationMain
class AppDelegate:
    UIResponder,
    UIApplicationDelegate
{
    
    var window: UIWindow?
    private var launchRouter: LaunchRouting?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // MARK: initial setting
        
        registerProviderFactories()
        
        setKakaoSDK()
        setLoggingChannel()
        
        setWindow()
        setLaunchRouter()
        
        return true
    }
}

// MARK: Private methods

extension AppDelegate {
    private func setKakaoSDK() {
        KakaoSDK.initSDK(appKey: "")
    }
    
    private func setLoggingChannel() {
        let xcode = XcodeLoggingChannel()
        Log.addChannels(xcode)
    }
    
    private func setWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
    }
    
    private func setLaunchRouter() {
        guard let window = self.window else { return }
        let appComponent = AppComponent()
        self.launchRouter = appComponent.appRootBuilder.build()
        self.launchRouter?.launch(from: window)
    }
}

protocol URLHandler: AnyObject {
  func handle(_ url: URL)
}
