//
//  protocol HasViewModel {   associatedtype ViewModel   var viewModel- Observable<ViewModel> { get } } .swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import RxSwift

protocol HasViewModel {
  associatedtype ViewModel
  var viewModel: Observable<ViewModel> { get }
}
