//
//  HasSetupConstraints.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import Foundation

protocol HasSetupConstraints {
    var didSetupConstrints: Bool { get }
    
    /**
     Override this method, if need to set Autolayout constraints

     Do not call `setNeedsUpdateConstraints()` inside your implementation.
     Calling `setNeedsUpdateConstraints()` schedules another update pass, creating a feedback loop.

     Do not call `setNeedsLayout()`, `layoutIfNeeded()`, `setNeedsDisplay()` in this method
     */
    func setupConstraints()
}
