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

import CoreKit
import GlobalThirdPartyLibrary
import AppFoundation

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
        LogFlume.addChannels(xcode)
    }
    
    private func setWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
    }
}

protocol URLHandler: AnyObject {
  func handle(_ url: URL)
}
