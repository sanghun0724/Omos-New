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
import CoreKit
import GlobalThirdPartyLibrary
import LogFlume

@UIApplicationMain
class AppDelegate:
    UIResponder,
    UIApplicationDelegate
{
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // MARK: initial setting
        
        registerProviderFactories()
        
        setKakaoSDK()
        setLoggingChannel()
        
        log.warning("target1",value: Environment.kakaoAPIKey)
        log.warning("target2",value: Environment.rootURL)
        
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
        log.addChannels(xcode)
    }
    
    private func setWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
    }
}

protocol URLHandler: AnyObject {
  func handle(_ url: URL)
}
