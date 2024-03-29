//
//  ReactiveExtension.swift
//  omos
//
//  Created by sangheon on 2023/05/17.
//
import UIKit

import RxSwift
import RxCocoa
import RxGesture

extension ObservableType {
    
    /// 중복 방지
    public func preventDuplication(milliseconds: Int = 300) -> Observable<Element> {
        return asObservable().throttle(.milliseconds(milliseconds),
                                       latest: false,
                                       scheduler: MainScheduler.asyncInstance)
    }
    
}

extension Reactive where Base: RxGestureView {
    
    /// 탭 제스처 버튼 중복 방지(dueTime: milliseconds)
    public func tapGestureWithPreventDuplication(dueTime: Int = 300) -> Observable<UITapGestureRecognizer> {
        return tapGesture().when(.recognized).preventDuplication(milliseconds: dueTime)
    }
    
}

extension Reactive where Base: UIButton {
    
    /// 탭 버튼 중복 방지(dueTime: milliseconds)
    public func tapWithPreventDuplication(dueTime: Int = 300) -> Observable<Void> {
        return tap.preventDuplication(milliseconds: dueTime)
    }
    
}

extension Reactive where Base: UIButton {

    public var isSelectedChanged: ControlProperty<Bool> {
        return base.rx.controlProperty(
            editingEvents:  [.allEditingEvents,.touchUpInside],
            getter: { $0.isSelected },
            setter: { $0.isSelected = $1 })
    }
}

extension Reactive where Base: UISwitch {

    public var isSelectedChanged: ControlProperty<Bool> {
        return base.rx.controlProperty(
            editingEvents:  [.allEditingEvents, .valueChanged],
            getter: { $0.isOn },
            setter: { $0.isOn = $1 })
    }
}

extension Array where Iterator.Element: ObservableType {

    func allSatisfy(_ predicate: @escaping (Iterator.Element.Element) throws -> Bool) -> Observable<Bool> {
        return Observable.combineLatest(self) { try $0.allSatisfy(predicate) }
    }
}
