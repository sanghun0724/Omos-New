//
//  HasErrorState.swift
//  omos
//
//  Created by sangheon on 2023/05/27.
//

import ReactorKit
import RxSwift

import AppFoundation

// MARK: - HasErrorState

public protocol HasErrorState {
    var myError: ReactorValue<MyError> { get }
}

