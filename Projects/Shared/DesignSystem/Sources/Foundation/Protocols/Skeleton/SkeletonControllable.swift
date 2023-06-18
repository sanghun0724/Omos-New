//
//  SkeletonControllable.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import UIKit
import SkeletonView


public protocol SkeletonControllable {
    func skeletonView(_ contentView: UIView, shouldStartAnimationWhen needAnimation: Bool)
}

public extension SkeletonControllable {
    func skeletonView(_ contentView: UIView, shouldStartAnimationWhen needAnimation: Bool) {
        DispatchQueue.main.async { [weak contentView] in
            if needAnimation {
                contentView?.showAnimatedGradientSkeleton()
            } else {
                contentView?.hideSkeleton()
            }
        }
    }
}
