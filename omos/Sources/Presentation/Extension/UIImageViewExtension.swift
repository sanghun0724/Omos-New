//
//  UIImageViewExtension.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/20.
//

import UIKit

import Kingfisher


extension UIImageView {
  func setImage(with url: URL?) {
    kf.setImage(with: url)
  }

  func cancelDownloadTask() {
    kf.cancelDownloadTask()
  }
}
