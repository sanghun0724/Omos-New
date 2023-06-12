//
//  ArrayExtension.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/18.
//

import Foundation

extension Array {
  subscript(safe index: Int) -> Element? {
    return indices ~= index ? self[index] : nil
  }
}
