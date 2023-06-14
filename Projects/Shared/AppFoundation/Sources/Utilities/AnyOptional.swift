//
//  AnyOptional.swift
//  AppFoundation
//
//  Created by sangheon on 2023/06/14.
//  Copyright © 2023 Omos. All rights reserved.
//

import Foundation

// MARK: - AnyOptional

/// Allows to match for optionals with generics that are defined as non-optional.
public protocol AnyOptional {
  /// Returns `true` if `nil`, otherwise `false`.
  var isNil: Bool { get }
}

// MARK: - Optional + AnyOptional

extension Optional: AnyOptional {
  public var isNil: Bool { self == nil }
}

