//
//  NicknamePresentableState.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import Foundation

struct NicknamePresentableState: HasLoadingState, HasErrorState {
    var isLoading: Bool = false
    var myError: ReactorValue<MyError> = .init()
}
