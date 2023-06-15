//
//  HasLoadingState.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import ReactorKit
import RxSwift

public protocol HasLoadingState {
    var isLoading: Bool { get }
}
