//
//  SkeletonViewsAnimatable.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/19.
//

import UIKit

import SkeletonView

protocol SkeletonViewsAnimatable {
    var skeletonViews: [UIView] { get }
    
    func showSkeletonAnimation()
    func hideSkeletonAnimation()
}

extension SkeletonViewsAnimatable {
    
    func showSkeletonAnimation() {
        skeletonViews.forEach { $0.showAnimatedGradientSkeleton()}
    }
    
    func hideSkeletonAnimation() {
        skeletonViews
            .filter(\.sk.isSkeletonActive)
            .forEach { $0.hideSkeleton(transition: .crossDissolve(0.25))}
    }
}
