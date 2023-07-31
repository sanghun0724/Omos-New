//
//  ImagePrefetchWorker.swift
//  BaseFeature
//
//  Created by 이상헌 on 2023/07/30.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

import Kingfisher
import RIBs

// MARK: - ImagePrefetchWorking

public protocol ImagePrefetchWorking: Working {
    func startPrefetch(withURLs urls: [URL])
}

// MARK: - ImagePrefetchWorker

public final class ImagePrefetchWorker: Worker, ImagePrefetchWorking {
    
    public func startPrefetch(withURLs urls: [URL]) {
        guard !urls.isEmpty else { return }
        Kingfisher.ImagePrefetcher(urls: urls).start()
    }
}
