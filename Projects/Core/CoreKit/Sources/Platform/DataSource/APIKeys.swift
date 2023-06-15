//
//  APIKeys.swift
//  CoreKit
//
//  Created by sangheon on 2023/06/15.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

public struct RestApiUrl {
#if DEBUG
    public static let debugUrl = ""
#else
    public static let restUrl = ""
#endif
}

public struct AWS {
    public static let access = ""
    public static let secret = ""
}

public struct KAKAO {
    public static let Key = ""
}
