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
    public static let debugUrl = Environment.rootURL.absoluteString
#else
    public static let restUrl = Environment.rootURL.absoluteString
#endif
}

public struct AWS {
    public static let access = ""
    public static let secret = ""
}

public struct KAKAO {
    public static let Key = Environment.kakaoAPIKey
}



public enum Environment {
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let rootURL = "ROOT_URL"
            static let kakaoAPIKey = "KAKAO_API_KEY"
        }
    }

    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    // MARK: - Plist values
    public static let rootURL: URL = {
        guard let rootURLstring = Environment.infoDictionary[Keys.Plist.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("Root URL is invalid")
        }
        return url
    }()

    public static let kakaoAPIKey: String = {
        guard let apiKey = Environment.infoDictionary[Keys.Plist.kakaoAPIKey] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return apiKey
    }()
}
