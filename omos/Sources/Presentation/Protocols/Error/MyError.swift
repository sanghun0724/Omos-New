//
//  MyError.swift
//  omos
//
//  Created by sangheon on 2023/05/27.
//

import Foundation

struct MyError: Error, Equatable {
    let title: String
    let messaage: String
}
