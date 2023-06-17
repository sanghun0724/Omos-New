//
//  BaseViewable.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/19.
//

import UIKit

protocol BaseViewable:
    UIView,
    HasSetupConstraints
{
    func initialize()
}
