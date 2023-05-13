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

let log = LogFlume.self

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var launchRouter: LaunchRouting?
    private var urlHandler: URLHandler?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        // MARK: initial setting
        
        setKakaoSDK()
        let xcode = XcodeLoggingChannel()
        log.addChannels(xcode)
        
        let result = AppRootBuilder(dependency: AppComponent()).build()
        self.launchRouter = result.launchRouter
        self.urlHandler = result.urlHandler
        launchRouter?.launch(from: window)
        
        return true
    }
    
    private func setKakaoSDK() {
        KakaoSDK.initSDK(appKey: "")
    }

}

protocol URLHandler: AnyObject {
  func handle(_ url: URL)
}
