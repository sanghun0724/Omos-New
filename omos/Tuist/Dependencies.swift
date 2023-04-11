//
//  Dependencies.swift
//  Config
//
//  Created by sangheon on 2023/04/11.
//

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/DevYeom/ModernRIBs", requirement: .branch("1.0.2"))
    ],
    platforms: [.iOS]
)
