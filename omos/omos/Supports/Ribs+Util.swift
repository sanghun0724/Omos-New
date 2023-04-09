//
//  Ribs+Util.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import Foundation
import ModernRIBs
import UIKit

public enum DissmissButtonType {
    case back, close
    
    public var iconSystemName: String {
        switch self {
        case .back:
            return "chevron.backward"
        case .close:
            return "xmark"
        }
    }
}

public final class NavigationControllerable: ViewControllable {
  
   public var uiviewController: UIViewController { self.navigationController }
   public let navigationController: UINavigationController
  
  public init(root: ViewControllable) {
    let navigation = UINavigationController(rootViewController: root.uiviewController)
    navigation.navigationBar.isTranslucent = false
    navigation.navigationBar.backgroundColor = .white
    navigation.navigationBar.scrollEdgeAppearance = navigation.navigationBar.standardAppearance
    navigation.title = "@@@@@@"
    
    self.navigationController = navigation
  }
}

public extension ViewControllable {
  
  func present(_ viewControllable: ViewControllable, animated: Bool, completion: (() -> Void)?) {
    self.uiviewController.present(viewControllable.uiviewController, animated: animated, completion: completion)
  }
    
  func presentFullScreen(_ viewControllable: ViewControllable, animated: Bool, completion: (() -> Void)?) {
    viewControllable.uiviewController.modalPresentationStyle = .fullScreen
      DispatchQueue.main.async {
          self.uiviewController.present(viewControllable.uiviewController, animated: animated, completion: completion)
      }
  }
  
  func dismiss(completion: (() -> Void)?) {
    self.uiviewController.dismiss(animated: true, completion: completion)
  }
  
  func pushViewController(_ viewControllable: ViewControllable, animated: Bool) {
    if let nav = self.uiviewController as? UINavigationController {
      nav.pushViewController(viewControllable.uiviewController, animated: animated)
    } else {
      self.uiviewController.navigationController?.pushViewController(viewControllable.uiviewController, animated: animated)
    }
  }
  
  func popViewController(animated: Bool) {
    if let nav = self.uiviewController as? UINavigationController {
      nav.popViewController(animated: animated)
    } else {
      self.uiviewController.navigationController?.popViewController(animated: animated)
    }
  }
  
  func popToRoot(animated: Bool) {
    if let nav = self.uiviewController as? UINavigationController {
      nav.popToRootViewController(animated: animated)
    } else {
      self.uiviewController.navigationController?.popToRootViewController(animated: animated)
    }
  }
  
  func setViewControllers(_ viewControllerables: [ViewControllable]) {
    if let nav = self.uiviewController as? UINavigationController {
      nav.setViewControllers(viewControllerables.map(\.uiviewController), animated: true)
    } else {
      self.uiviewController.navigationController?.setViewControllers(viewControllerables.map(\.uiviewController), animated: true)
    }
  }
    
  var topViewControllable: ViewControllable {
        var top: ViewControllable = self
        
        while let presented = top.uiviewController.presentedViewController as? ViewControllable {
            top = presented
        }
        
        return top
   }
}

public extension Array {
  subscript(safe index: Int) -> Element? {
    return indices ~= index ? self[index] : nil
  }
}
