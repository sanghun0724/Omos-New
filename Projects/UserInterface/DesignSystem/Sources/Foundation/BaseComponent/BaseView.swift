//
//  BaseView.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/22.
//

import UIKit

import RxSwift

open class BaseView:
    UIView,
    BaseViewable,
    HasDisposeBag
{
    
    // MARK: Properties
    
    public var disposeBag = DisposeBag()
    
    private(set) var didSetupConstrints: Bool = false
    
    // MARK: Inii & deinit
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    open override func updateConstraints() {
        self.setupConstraintsIfNeeded()
        super.updateConstraints()
    }
    
    open func initialize() {
        // overridePoint
        setNeedsUpdateConstraints()
    }
    
    open func setupConstraints() {
        // override here
    }
    
    // MARK: - Private methods
    
    private func setupConstraintsIfNeeded() {
        guard !self.didSetupConstrints else { return }
        self.setupConstraints()
        self.didSetupConstrints = true
    }
}

