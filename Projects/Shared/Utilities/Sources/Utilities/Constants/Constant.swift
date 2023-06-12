//
//  Constant.swift
//  omos
//
//  Created by sangheon on 2023/05/13.
//

import UIKit

import MyConstants

enum CommonUI {
    static let loginCorner = 4.0
    static let LoginTopViewHeight = 0.6
    static let mainHeight = UIScreen.main.bounds.height
    static let mainWidth = UIScreen.main.bounds.width
    static var statuBarHeight: CGFloat = 0.0
}

enum Device {
    static let deviceNames: [String] = [
        "iPhone SE",
        "iPhone 11 Pro Max"
    ]
}

enum RestApiUrl {
#if DEBUG
    static let restUrl = URLConstants.debugUrl
#else
    static let restUrl = URLConstants.relaseURL
#endif
}

enum KakaoKey {
    static let kakaoKey = KAKAO.Key
}

