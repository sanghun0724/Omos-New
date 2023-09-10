//
//  AdaptivePresentation.swift
//  DesignSystem
//
//  Created by 이상헌 on 2023/07/22.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

public protocol AdaptivePresentationControllerDelegate: AnyObject {
  func presentationControllerDidDismiss()
}

public final class AdaptivePresentationControllerDelegateProxy: NSObject, UIAdaptivePresentationControllerDelegate {
  
  public weak var delegate: AdaptivePresentationControllerDelegate?
  
  public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    delegate?.presentationControllerDidDismiss()
  }
}
