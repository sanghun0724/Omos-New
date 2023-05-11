//
//  HasConfigure.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/20.
//

import Foundation

protocol HasConfigure {
    associatedtype ViewModel
    func configure(by viewModel: ViewModel)
}
